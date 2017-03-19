class Expense < ApplicationRecord
  belongs_to :expense_type
  belongs_to :user
  #has_one :price
  #051202643
  belongs_to :price
  accepts_nested_attributes_for :price, allow_destroy: true

  enum pay_type: [:tarjeta, :efectivo]

  STATUS_OPTIONS = %w(tarjeta efectivo)
  validates :pay_type, :inclusion => {:in => STATUS_OPTIONS}
end
