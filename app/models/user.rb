class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable

  def self.from_omniauth(access_token)
    data = access_token.info
    account = User.where(email: data['email']).first
    account ||= User.create(name: data['name'], email: data['email'], password: Devise.friendly_token[0, 20])
    account
  end
end
