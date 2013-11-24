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
     find_field('startup_name').value.should eq 'Visible'
  end	
	
end