# frozen_string_literal: true

require 'spec_helper'
include Warden::Test::Helpers

module RequestHelpers
  def create_logged_in_user
    user = FactoryBot.create(:user)
    login_as(user)
    user
  end
end
