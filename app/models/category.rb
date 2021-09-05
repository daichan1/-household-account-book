class Category < ApplicationRecord
  has_many :income_and_expenditures
  belongs_to :user

  validates :name, presence: true
end
