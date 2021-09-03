module IncomeAndExpendituresHelper
  def display_income_and_expenditure(is_income_and_expenditure)
    if is_income_and_expenditure == "expenditure"
      return "支出"
    elsif is_income_and_expenditure == "income"
      return "収入"
    end
  end
end
