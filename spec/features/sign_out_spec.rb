require 'rails_helper'

RSpec.describe "devise based admins", type: :feature, driver: :poltergeist  do
  before :each do
  end

  def admin_sign_in
    visit "/admins/sign_in"
    fill_in "Email", :with => "test@librely.com"
    fill_in "Password", :with => "password"
    click_button "Log in"
  end

  it "signs an admin in" do
    #admin_sign_in
    FactoryGirl.create(:admin)

    visit "/admins/sign_in"
    fill_in "Email", :with => "test@librely.com"
    fill_in "Password", :with => "password"
    click_button "Log in"

    expect(page).to have_content("Signed in successfully.")
  end

  #it "signs an admin out" do
    #admin_sign_in
    #expect(page).to have_content("Signed in successfully.")

    #click_link_or_button "sign out"
    #expect(page).to have_content("Signed out successfully.")
  #end
end
