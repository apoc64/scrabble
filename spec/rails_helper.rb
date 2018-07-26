# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'support/factory_bot'

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!
end

def stubbed_oxford_response
  [{:id=>"mindfulness",
    :language=>"en",
    :lexicalEntries=>
     [{:language=>"en",
       :lexicalCategory=>"Noun",
       :sentences=>
        [{:regions=>["North American"], :senseIds=>["m_en_gbus0645350.006"], :text=>"So mindfulness of drinking is already one kind of enlightenment."},
         {:regions=>["Canadian"],
          :senseIds=>["m_en_gbus0645350.009"],
          :text=>"Meditation is one way to express mindfulness in a dedicated, concentrated manner."},

         {:regions=>["unknown"],
          :senseIds=>["m_en_gbus0645350.009"],
          :text=>
           "If you think mindfulness involves labeling what comes up and doing everything in a very deliberate fashion, you will suffer enormously because th
  e world is not under your control."}
  ]}]}]
end
