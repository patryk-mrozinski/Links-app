class LinksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_link, only: %i[show edit update destroy like dislike]

  def index
    @link = Link.new
    @links = Link.all.order(created_at: :desc)
    @new_comment = Comment.new(user: current_user)
  end

  def show
    @new_comment = Comment.build_from(@link, current_user.id)
  end

  def new
    @link = Link.new
  end

  def create
    @link = current_user.links.build(link_params)

    if @link.save
      redirect_to @link, notice: 'yay'
    else
      @links = Link.all
      @new_comment = Comment.new(user: current_user)
      render 'index'
    end
  end

  def edit; end

  def update
    if @link.update(link_params)
      redirect_to @link
    else
      render 'edit'
    end
  end

  def destroy
    @link.destroy
    redirect_to root_path
  end

  def like
    @link.upvote_by current_user
    redirect_to root_path
  end

  def dislike
    @link.downvote_from current_user
    redirect_to root_path
  end

  private

  def set_link
    @link = Link.find(params[:id])
  end

  def link_params
    params.require(:link).permit(:name, :url, :image, :all_tags)
  end
end
