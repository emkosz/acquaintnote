require 'rails_helper'

feature "Adds new contact" do

  scenario "is successfull" do

    visit "/friends"
    click_link "Add a new friend"

    fill_in "First name", with: "Emma"
    fill_in "Last name", with: "Koszinowski"
    fill_in "Description", with: "Rails dev"
    fill_in "Phone number", with: "4444444444"
    fill_in "Email", with: "emma@mail.com"
    fill_in "Twitter url", with: "http://twitter.com/emma"
    fill_in "Facebook url", with: "http://facebook.com/emma"
    click_on "Save"

    expect(page).to have_content("Emma")
    expect(page).to have_content("Koszinowski")
    expect(page).to have_content("4444444444")
    expect(page).to have_content("emma@mail.com")
    expect(page).to have_content("Twitter")
    expect(page).to have_content("Facebook")
  end
end
