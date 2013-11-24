require 'spec_helper.rb'


describe "New Startup Page",:js => true  do 

  it " should have content Visable Project" do
    visit '/'
    expect(page).to have_content('Visible Project')
  end

  it "should fill in input boxes" do
  	 visit '/'
     fill_in 'startup_website', with:"visible.vc"
     click_button "Fill From Angellist"
     sleep(3)
     find_field('startup_name').value.should eq 'Visible'
  end	 

  it "should display url not found" do
  	 visit '/'
     fill_in 'startup_website', with:"fakesite"
     click_button "Fill From Angellist"
     expect(page).to have_content('Url not found')

  end	
	
end