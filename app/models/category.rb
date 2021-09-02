class Category < ApplicationRecord
  has_many :income_and_expenditures

  validates :name, presence: true
end
