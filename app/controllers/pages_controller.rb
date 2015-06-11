class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update]
  before_action :set_new_comment, only: :show

  DEFAULT_PAGE_PATH = 'TopPage'

  def index
    @page = Page.find_by(path: DEFAULT_PAGE_PATH)
    render 'show'
  end

  def show
  end

  def edit
    @page = Page.new(path: params[:path]) if @page.blank?
  end

  def update
    if @page.blank?
      @page = Page.create(page_params)
    else
      @page.update(page_params)
    end

    redirect_to page_path
  end

  private

  def set_page
    @page = Page.find_by(path: params[:path])
  end

  def set_new_comment
    @comment = Comment.new(page: @page) if @page.present?
  end

  def page_params
    params.require(:page).permit(:path, :title, :content)
  end
end
