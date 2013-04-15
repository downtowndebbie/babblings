class PostsController < ApplicationController

  def index
    @posts = Post.active.limited.recent
  end

  def show
    @posts = Post.find(params[:id])
  end

  def page
    @posts = Post.active.limited.offset(params[:page].to_i * Rails.configuration.items_per_page).recent
    render :layout => false
  end
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])

    if @post.save
      redirect_to @post, notice: 'It worked!'
    else
      render action: :new
    end
  end

  def delete
    @post = Post.update(params[:id], :is_deleted => true)
    render :action => :success if @post.save
  end

  def undelete
    @post = Post.unscoped.update(params[:id], :is_deleted => false)
    render :action => :success if @post.save
  end

  def hide
    @post = Post.update(params[:id], :is_hidden => true)
    render :action => :success if @post.save
  end

  def unhide
    @post = Post.update(params[:id], :is_hidden => false)
    render :action => :success if @post.save
  end

end
