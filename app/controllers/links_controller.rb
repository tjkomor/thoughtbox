class LinksController < ApplicationController
  def index
    @links = Link.all
  end

  def create
    @link = Link.new(link_params)
    if @link.save
    else
      flash[:error] = @link.errors.full_messages.join(", ")
    end
    redirect_to links_path
  end

  private

  def link_params
    params.require(:link).permit(:url,
                                 :title)
  end
end
