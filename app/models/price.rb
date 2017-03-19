class Price < ApplicationRecord
	#belongs_to :expense
	has_one :expense
	enum money: [:soles, :dolares]

	STATUS_OPTIONS = %w(soles dolares)

  validates :money, :inclusion => {:in => STATUS_OPTIONS}

  before_create :set_total

  ROUND = 1000.0

  def show_total
  	self.total / self.dolar_price / ROUND
  end
  def show_dolar_price
  	self.dolar_price / ROUND
  end

  private
  def set_total
  	self.total = self.total * self.dolar_price
  end
end
