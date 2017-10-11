class User < ApplicationRecord
  acts_as_token_authenticatable
  has_many :patients
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
