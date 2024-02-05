class AdminControlsController < ApplicationController

  def adminhome

  end
  def adminlogin
    @admin = Admin.where(username: params[:un], password: params[:pass])
    if @admin.present?
      redirect_to :action => 'index'
    else
      redirect_to :action=> 'adminhome'
    end

  end
  def index
    @news = News.all
  end
  def show
  end
  def new
    @category = Category.where.not(id: 1)
  end
  def create
    @news = News.new(news_params)
    if @news.save
      redirect_to :action => 'index'
    else
      redirect_to :action => 'new'
      # render "error"
    end
  end
  def edit
    @news = News.find(params[:id])
    @category = Category.where.not(id: 1)
  end
  def update
    @news = News.find(params[:id])
    if @news.update(news_params)
      redirect_to :action => 'index'
    else
      redirect_to :action => 'edit'
    end
  end
  def destroy
    @news = News.find(params[:id])
    if @news.destroy
      redirect_to :action => 'index'
    else
      redirect_to :action => 'index'
    end

  end

  def visibility
    @news = News.find(params[:id])
    if @news.hide == 1
      @news.update(hide: 0)
      redirect_to :action => 'index'
    else
      @news.update(hide:1)
      redirect_to :action => 'index'
      end
  end

  def new_category

  end
  def create_category
    @category = Category.new(category_params)
    if @category.save
      redirect_to :action => 'index'
    else
      redirect_to :action => 'new_category'
    end
  end

  def delete_category
    @category = Category.find(params[:id])
    @news = News.where(category_id: @category)
    @news.update(category_id: 1)
    if @category.destroy
      redirect_to :action => 'list_category'
    else
      render '/error.html.erb'
    end
  end

  def list_category
    @category = Category.where.not(id: 1)

  end
  def edit_category
    @category = Category.find((params[:id]))
  end

  def update_category
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to :action => 'list_category'
    else
      redirect_to :action => 'edit_category'
    end
  end

  def news_params
    params.require(:news).permit(:title, :content, :category_id, :source, :hide)
  end

  def category_params
    params.require(:category).permit(:id, :name)
  end

  def admin_params
    params.require(:admin).permit(:name, :password)
  end
end
