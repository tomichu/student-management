ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

	RSpec.configure do |config|
	  config.fixture_path = "#{::Rails.root}/spec/fixtures"
		  config.use_transactional_fixtures = true
			  config.infer_spec_type_from_file_location!

				config.before(:suite) do
					FactoryGirl.reload
				end

	end

