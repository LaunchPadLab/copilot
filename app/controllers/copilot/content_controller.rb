module Copilot
  class ContentController < ApplicationController

    include Copilot::Helper

    def update
      if signed_in?
        @content = Content.find_or_create_by(slug: params[:slug])
        if @content.update(value: params[:value])
          render json: {result: 'success'}
        else
          render json: {errors: @content.errors, status: :unprocessable_entity}
        end
      end
    end
  end
end
