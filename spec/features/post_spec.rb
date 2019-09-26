# frozen_string_literal: true
require 'rails_helper'
require 'capybara/rspec'
# include RequestHelpers

feature 'User creates a new blog' do
  scenario 'clicks new blog link' do
    visit new_post_path
    expect(page).to have_content('New Blog')
    click_link 'New Blog'
    fill_in 'Post Title', with: 'TestJ'
    fill_in 'Post', with: 'This is my test body'
    click_button 'Submit'
    expect(page).to have_content('TestJ')
    expect(page).to have_content('This is my test body')
  end
end
