class User < ApplicationRecord
  has_secure_password

  has_many :members
  has_many :groups, through: :members
  has_many :media

  validates :username, { presence: true, uniqueness: { case_sensitive: false } }
  # validates :password_digest, presence: true
  # validates :name, presence: true

end
