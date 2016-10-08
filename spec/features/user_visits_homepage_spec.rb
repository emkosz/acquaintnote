require 'rails_helper'

describe "User goes to homepage" do

  it "is successfull" do
    visit '/'
    expect(page).to have_content("Acquaintnote")
  end
end

# feature "User visits homepage" do
#   scenario "successfully" do
#     visit root_path
#
#     expect(page).to have_css 'h1', text: 'Acquaintnote'
#   end
# end
