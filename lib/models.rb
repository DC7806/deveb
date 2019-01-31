module Sourceable
  extend ActiveSupport::Concern

   included do
    set_root_path "data"
    set_filename self.name.underscore
  end
end

class Portfolio < ActiveYaml::Base
  include Sourceable
end