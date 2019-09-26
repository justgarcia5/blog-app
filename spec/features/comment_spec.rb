# frozen_string_literal: true

require 'rails_helper'
require 'capybara/rspec'
include RequestHelpers

feature 'User creates a new comment' do
  let(:user) { create_logged_in_user }
  let(:post) { create(:post) }
  scenario 'clicks read more... link' do
    visit post_path(post, user)
    expect(page).to have_content('New Comment')
    expect(page).to have_content('Comments')
    fill_in 'Comment', with: 'TestJ'
    click_button 'Submit'
    expect(page).to have_content('TestJ')
  end
end
