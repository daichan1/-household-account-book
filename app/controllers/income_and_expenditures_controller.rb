class IncomeAndExpendituresController < ApplicationController
  def index
    @income_and_expenditures = IncomeAndExpenditure.all.recent
  end

  def show
  end

  def new
    @income_and_expenditure = IncomeAndExpenditure.new
    @categories = Category.all
  end

  def create
    @income_and_expenditure = IncomeAndExpenditure.new(income_and_expenditures_params)
    if @income_and_expenditure.save
      redirect_to income_and_expenditures_path, flash: { income_and_expenditures_notice: "収支登録が完了しました" }
    else
      @categories = Category.all
      render "new", collection: @categories
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def income_and_expenditures_params
    params.require(:income_and_expenditure).permit(:is_income_and_expenditure, :name, :price, :category_id, :user_id)
  end
end
