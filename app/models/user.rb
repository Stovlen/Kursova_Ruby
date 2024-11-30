class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true, format: { with: /\A[А-Яа-яЁёЇїІіЄєҐґ]+\z/, message: "може містити лише кириличні літери" }
  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@gmail\.com\z/, message: "повинен закінчуватись на '@gmail.com'" }
  validates :password, presence: true, length: { minimum: 6 }, if: :password

  validates :role, inclusion: { in: %w[user admin], message: "може бути лише 'user' або 'admin'" }

  # Методи
  def admin?
    role == "admin"
  end

  def user?
    role == "user"
  end

end
