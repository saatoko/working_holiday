class Api::SignupController < ApplicationController
  def create
    user = User.new(user_params)

    if user.save
      payload = { user_id: user.id }
      # カスタムペイロードを使用してセッションを生成
      # 更新トークンIDをアクセスペイロードに追加し、最後に期限切れになったアクセストークンによってセッションの更新を実行できるようにする
      session = JWTSessions::Session.new(payload: payload, refresh_by_access_allowed: true)
      tokens = session.login

      response.set_cookie(JWTSessions.access_cookie,
                          value: tokens[:access],
                          # HttpOnly(JSで操作不能)
                          httponly: true,
                          # Secure(HTTPs通信のみで取引)なクッキーとしてのアクセストークン
                          secure: Rails.env.production? )
      render json: { csrf: tokens[:csrf] }
    else  
      render json: { error: user.errors.full_messages.join(' ') }, status: :unprocessable_entity
    end
  end


  private

    def user_params
      params.permit(:email, :nickname, :password, :password_confirmation)
    end
end
