class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path, flash: { category_notice: "カテゴリーの登録が完了しました" }
    else
      @categories = Category.all
      render "index", collection: @categories
    end
  end

  def update
    category = Category.find(params[:id])
    if category.update(category_params)
      redirect_to categories_path, flash: { category_notice: "カテゴリーの更新が完了しました" }
    else
      @categories = Category.all
      render "index", collection: @categories
    end
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy
    redirect_to categories_path, flash: { category_notice: "カテゴリーの削除が完了しました" }
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
