class Api::SigninController < ApplicationController
  # 構築した更新エンドポイントを保護する
  # Authorizationmixin内のヘルパーメソッド。リクエスト内のアクセストークンを検証する。
  # 最初にヘッダーから、次にCookieからトークンをフェッチしようとする
  # リクエストで送られたトークンの内容の検証し、検証失敗で例外を出す。(only: destroy(セッション破棄時))
  before_action :authorize_access_request!, only: [:destroy]

  # createはトークン作成（セッション作成）
  def create
    user = User.find_by!(email: params[:email])

    if user.authenticate(params[:password])
      # payloadは、トークン自体に内包させられるユーザー情報
      payload = { user_id: user.id }
      session = JWTSessions::Session.new(payload: payload, refresh_by_access_allowed: true)
      tokens = session.login

      # このメソッドで、「Set-Cookieヘッダー」に、{jwt_access=アクセストークン; Secure; HttpOnly}をセットし、クライアントに送る。
      response.set_cookie(JWTSessions.access_cookie, 
                          value: tokens[:access],
                          httponly: true,
                          # 開発環境ではHTTPs通信ではないので、secure: falseになるようにしないと、クライアントがクッキーを受け取れない
                          secure: Rails.env.production?)

      # LocalStorageに保存するためのcsrfトークンを返しておく
      render json: { csrf: tokens[:csrf] }
    else  
      not_authorized
    end
  end

  def destroy
    session = JWTSessions::Session.new(payload: payload)
    session.flush_by_access_payload
    render json: :ok
  end


  private
    def not_found
      render json: { error: "Cannot find email/password combination" }, status: :not_found
    end
end

# アクセストークントークンをCookieを介して渡し、CSRFをレンダリングするRailsログインコントローラー
