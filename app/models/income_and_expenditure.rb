class IncomeAndExpenditure < ApplicationRecord
  belongs_to :user
  belongs_to :category

  enum is_income_and_expenditure: { expenditure: false, income: true }

  validates :name, presence: true
  validates :price, presence: true

  scope :recent, -> { order(updated_at: :desc) }

  def self.income_and_expenditure_chart_data(data)
    result = {}
    data.each do |datum|
      result.store(datum.category.name, datum.price)
    end
    return result
  end
end
