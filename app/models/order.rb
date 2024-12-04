class Order < ApplicationRecord
  validates :name, :surname, :phone, presence: true
  validates :email, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "некоректний формат" }, allow_blank: true
end