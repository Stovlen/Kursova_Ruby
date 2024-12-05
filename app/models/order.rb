class Order < ApplicationRecord
  validates :name, :surname, :phone, presence: true
  validates :email, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "некоректний формат" }, allow_blank: true

  has_many :order_items, dependent: :destroy
  accepts_nested_attributes_for :order_items
end