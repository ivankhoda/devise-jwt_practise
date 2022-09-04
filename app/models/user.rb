class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :lockable,
         :jwt_authenticatable,
         jwt_revocation_strategy: JwtDenylist
  self.skip_session_storage = %i[http_auth params_auth token_auth]
end
