class StartupsController < ApplicationController
  require 'open-uri'
  def new
    @startup = Startup.new
  end	

  def show
    @startup = Startup.find(params[:id])

  end	

  def fetch
  	states =[ "Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware", "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"]
    term = params["data"]
    url_friendly = url_parser(term)
    response = "http://api.angel.co/1/startups/search?domain=" + url_friendly
    string = open(response).first
    hash = JSON.parse(string)
    state = find_location(hash)
    render :json => {:name => hash["name"],
    	   :angellist_url => hash["angellist_url"],
    	   :logo_url => hash["logo_url"],
    	   :description => hash["product_desc"],
    	   :pitch => hash["high_concept"],
    	   :company_url => hash["company_url"],
    	   :state => state,
    	} 



  end	

  def create
    startup = params[:startup]
    created_startup =Startup.create(website: startup[:website],name: startup[:name],logo_url: startup[:logo_url],state: startup[:state],description: startup[:description],pitch:startup[:pitch],markets: startup[:markets],angel_url:startup[:angel_url])
    redirect_to startup_path(created_startup)
  end	
end