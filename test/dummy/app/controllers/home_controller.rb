class HomeController < ApplicationController

  def index
    @contents = Copilot::Content.for_page(params[:controller], params[:action])
  end

end
