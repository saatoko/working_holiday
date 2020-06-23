class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  include JWTSessions::RailsAuthorization
  # トークンをデコードできないか、JWTクレームが無効です。
  # rescue_fromメソッドは、例外が発生した場合に実行するメソッドを指定できる。
  rescue_from JWTSessions::Errors::Unauthorized, with: :not_authorized

  private

  # トークンからエンコードされたデータをフェッチするために使用できる
  def current_user
    @current_user ||= User.find(payload['user_id'])
  end
  
  def not_authorized
    render json: { error: 'Not authorized' }, status: :unauthorized
  end
end
