module Copilot
  class User < ActiveRecord::Base
    has_secure_password
  end
end
