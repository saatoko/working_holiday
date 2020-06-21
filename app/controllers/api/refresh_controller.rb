class Api::RefreshController < ApplicationController
  
  before_action :authorize_refresh_by_access_request!

  def create
    # 更新はアクセストークンの有効期限が切れたら実行する必要がある
    session = JWTSessions::Session.new(payload: claimless_payload, refresh_by_access_allowed: true)
    tokens = session.refresh_by_access_allowed do
      raise JWTSessions::Errors::Unauthorized, "Somethings not right here"
    end
    response.set_cookie(JWTSessions.access_cookie,
                        value: tokens[:access],
                        httponly: true,
                        secure: Rails.env.production?)
    render json: { csrf: tokens[:csrf] }
  end
end

# トークントランスポートとしてCookieを使用したアクセスコントローラによるRailsの更新
