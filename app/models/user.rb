class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :items

  validates :name, presence: true, length: { maximum: 30 }
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true, format: { with: /\A[a-z0-9]+\z/ }, length: { minimum: 6 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
end
