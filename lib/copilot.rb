require 'copilot/engine'
require 'copilot/helper'
require 'copilot/router'
require 'copilot/configuration'

ActiveSupport.on_load(:action_view) do
  include Copilot::Helper
end

module Copilot
  def self.configure(&block)
    block.call(configuration)
  end

  def self.configuration
    @configuration ||= Configuration.new
  end
end
