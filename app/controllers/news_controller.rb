class NewsController < ApplicationController
  def DisplayTop4Articles
    @news = News.where(hide: 1).order(created_at: :desc).limit(4)
  end

  def ShowCategory
    @category = Category.where.not(id: 1)
    @news = News.where(hide: 1, category_id: @category)
  end

  def ShowArticle
    @news = News.find(params[:id])
    @category = Category.find(@news.category_id)
    @comments = Comment.where(news_id: params[:id])
  end

  def AddComment
    @comment = Comment.create(public_notes: params[:comment], news_id: params[:id])
    # redirect_to(ShowArticle)

    if @comment.save
      redirect_to :action => 'ShowArticle'
    else
      @news = News.all
      render :action => 'DisplayTop4Articles'
    end
  end


  def ShowSearchResult
    @news = News.where("content like ?", "%" + params[:keyword] + "%")
  end
end
