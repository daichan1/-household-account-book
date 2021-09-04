class IncomeAndExpendituresController < ApplicationController
  def index
    @incomes = IncomeAndExpenditure.income.recent
    @expenditures = IncomeAndExpenditure.expenditure.recent
    @income_chart = IncomeAndExpenditure.income_and_expenditure_chart_data(@incomes)
    @expenditure_chart = IncomeAndExpenditure.income_and_expenditure_chart_data(@expenditures)
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
    @income_and_expenditure = IncomeAndExpenditure.find(params[:id])
    @categories = Category.all
  end

  def update
    @income_and_expenditure = IncomeAndExpenditure.find(params[:id])
    if @income_and_expenditure.update(income_and_expenditures_params)
      redirect_to income_and_expenditures_path, flash: { income_and_expenditures_notice: "収支の更新が完了しました" }
    else
      @categories = Category.all
      render "edit", collection: @categories
    end
  end

  def destroy
    income_and_expenditure = IncomeAndExpenditure.find(params[:id])
    income_and_expenditure.destroy
    redirect_to income_and_expenditures_path, flash: { income_and_expenditures_notice: "収支の削除が完了しました" }
  end

  private

  def income_and_expenditures_params
    params.require(:income_and_expenditure).permit(:is_income_and_expenditure, :name, :price, :category_id, :user_id)
  end
end
