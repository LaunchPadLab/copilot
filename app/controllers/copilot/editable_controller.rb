class EditableController < ApplicationController
  def update
    params[:data].values.each do |v|
      pp v
      # ContentStore.put(v.key, v.value)
    end
    render json: {result: 'success'}
  end

end


