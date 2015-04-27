module Copilot
  class SessionsController < ApplicationController
    def new
    end

    def create
      session[:user_id] = 100
      redirect_to '/'
    end
  end
end
