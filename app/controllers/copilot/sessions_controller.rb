module Copilot
  class SessionsController < ApplicationController
    def new
    end

    def create
      session[:user_id] = 100
      redirect_to '/'
    end

    def destroy
      session[:user_id] = nil
      redirect_to '/'
    end
  end
end
