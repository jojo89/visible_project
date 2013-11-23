require 'spec_helper.rb'


describe "New Startup Page" do 

  it " should have content Visable Project" do
    visit '/'
    expect(page).to have_content('Visible Project')
  end

	
end