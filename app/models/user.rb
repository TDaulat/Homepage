class User < ActiveRecord::Base
  attr_accessible :admin, :name, :provider, :uid, :oauth_token, :oauth_expires_at, :image_url

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.image_url = auth.info.image
      user.save!
    end
  end
end
