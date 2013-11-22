class StartupsController < ApplicationController
  require 'open-uri'
  def new
    @startup = Startup.new
  end	

  def show
    @startup = Startup.find(params[:id])

  end	

  def fetch
    term = params["data"]
    url_friendly = url_parser(term)
    response = "http://api.angel.co/1/startups/search?domain=" + url_friendly
    string = open(response).first
    puts string
    hash = JSON.parse(string)
    puts hash

  end	

  def create
    startup = params[:startup]
    created_startup =Startup.create(website: startup[:website],name: startup[:name],logo_url: startup[:logo_url],state: startup[:state],description: startup[:description],pitch:startup[:pitch],markets: startup[:markets],angel_url:startup[:angel_url])
    redirect_to startup_path(created_startup)
  end	
end