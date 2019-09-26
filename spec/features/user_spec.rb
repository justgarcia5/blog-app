# frozen_string_literal: true

require 'rails_helper'
require 'capybara/rspec'
include RequestHelpers

feature 'User can be created' do
  scenario 'clicks sign up link' do
    visit new_user_registration_path
    expect(page).to have_content('Sign up')
  end
  scenario 'with attributes for ' do
    visit new_user_registration_path
    fill_in 'Email', with: 'email1@email.com'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    click_button 'Sign up'
    expect(page).to have_content('Blogs')
  end
  feature 'Visitor edits a user' do
    let(:user) { create_logged_in_user }
    background do
      @user = User.create!(email: 'testa@testa.com', password: 'icecream')
      @user2 = User.create!(email: 'testb@testa.com', password: 'icecream')
    end
    scenario 'clicks edit user on header' do
      visit edit_user_registration_path(@user, user)
      expect(page).to have_content('Edit User')
      expect(@user.email).to eq('testa@testa.com')
      expect(@user.password).to eq('icecream')
    end
    scenario 'change user name and email' do
      visit edit_user_registration_path(@user, user)
      fill_in 'Email', with: 'testb@testb.com'
      fill_in 'Current password', with: '123456'
      click_button 'Update'
      expect(page).to have_content('Blogs')
    end
    scenario 'can not create/edit user with duplicate email' do
      visit edit_user_registration_path(@user2, user)
      fill_in 'Email', with: 'testa@testa.com'
      fill_in 'Password', with: 'icecream'
      click_button 'Update'
      expect(page).to have_content('Email has already been taken')
    end
  end
end
feature 'User can log out' do
  let(:user) { create_logged_in_user }
  scenario 'clicks sign out' do
    visit root_path(user)
    # byebug
    click_link 'Log out'
    expect(page).to have_content('Blogs')
  end
end
