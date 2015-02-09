require 'copilot/engine'
require 'copilot/helper'
require 'copilot/router'

ActiveSupport.on_load(:action_view) do
  include Copilot::Helper
end

module Copilot
end
