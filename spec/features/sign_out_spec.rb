require 'rails_helper'
require_relative '../support/database_cleaner'
include Warden::Test::Helpers

describe 'devise based admins', type: :feature, driver: :poltergeist  do
  let :admin_sign_in do
    visit '/admins/sign_in'
    fill_in 'Email', with: 'test@librely.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
  end

  before :each do
    @admin = FactoryGirl.create(:admin)
    admin_sign_in
  end

  it 'signs an admin in' do
    expect(page).to have_content('Signed in successfully.')
  end

  it 'signs in as an admin' do
    Warden.test_mode!
    login_as(@admin, :scope => :admin)
    Warden.test_reset!
  end


  context 'when an admin is signed in' do
    it 'signs an admin out' do
      click_link_or_button 'sign out'
      expect(page).to have_content('Signed out successfully.')
    end
  end
end
