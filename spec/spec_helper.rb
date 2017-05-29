$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "spree_chargebee"


require 'pry'

RSpec.configure do |config|

  # Infer an example group's spec type from the file location.
  config.infer_spec_type_from_file_location!

  config.order = 'random'
end
