require 'rails_helper'

RSpec.describe "UserRegistrations", type: :system do
  before do
    driven_by(:rack_test)
  end

  it "redirect new subscriber to the wait for confirmation page" do
    visit '/users/sign_up'

    fill_in 'Email',    with: 'alice@example.com'
    fill_in 'Nickname', with: 'alice'
    fill_in 'Password', with: 'password'
    click_button 'Continue'

    expect(page).to have_current_path('/wait_for_confirmation')
  end
end
