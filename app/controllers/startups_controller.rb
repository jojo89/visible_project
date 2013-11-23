class StartupsController < ApplicationController
  require 'open-uri'
  def new
    @startup = Startup.new
  end	

  def show
    @startup = Startup.find(params[:id])

  end	


  def fetch_website
    term = params["data"]
    url_friendly = url_parser(term)
    string = make_friendly_url(url_friendly).first
    hash = JSON.parse(string)
    state = find_location(hash)
    city = hash["locations"].first["display_name"]
    hashed_markets = hash["markets"]
    markets = grab_markets(hashed_markets)
    render :json => {:name => hash["name"],
    	   :angellist_url => hash["angellist_url"],
    	   :logo_url => hash["logo_url"],
    	   :description => hash["product_desc"],
    	   :pitch => hash["high_concept"],
    	   :company_url => hash["company_url"],
    	   :state => state,
         :city => city,
         :markets => markets,
    	} 
  end	


  def create
    startup = params[:startup]
    created_startup =Startup.create(website: startup[:website],name: startup[:name],logo_url: startup[:logo_url],state: startup[:state],description: startup[:description],pitch:startup[:pitch],markets: startup[:markets],angel_url:startup[:angel_url])
    redirect_to startup_path(created_startup)
  end	
end