require "spec_helper.rb"
include ApplicationHelper
require 'open-uri'

describe "Application Helper"   do

	before do
      @hash = { "locations"=>[{"id"=>1692}]}
      @markets = [{"display_name"=>"SaaS"}, {"display_name"=>"Finance"}]
      @url = "https://visible.vc/"
      @response_string = "{\"id\":82745,\"hidden\":false,\"community_profile\":false,\"name\":\"Visible\",\"angellist_url\":\"https://angel.co/visible\",\"logo_url\":\"https://s3.amazonaws.com/photos.angel.co/startups/i/82745-5bb8026358bafed53fa639e2cac90f77-medium_jpg.jpg?buster=1357598262\",\"thumb_url\":\"https://s3.amazonaws.com/photos.angel.co/startups/i/82745-5bb8026358bafed53fa639e2cac90f77-thumb_jpg.jpg?buster=1357598262\",\"quality\":6,\"product_desc\":\"Visible simplifies the sharing, management, and reporting of data between startups and investors. Visible was launched by a group of founders and investors that had been struggling with the vexing, but all too common, problems of tracking investment performance and managing communications between startups and investors. \",\"high_concept\":\"Data sharing for startups and their investors.\",\"follower_count\":86,\"company_url\":\"http://www.visible.vc\",\"created_at\":\"2012-04-12T16:11:42Z\",\"updated_at\":\"2013-09-04T21:11:20Z\",\"crunchbase_url\":null,\"twitter_url\":\"http://twitter.com/visiblevc\",\"blog_url\":\"\",\"video_url\":null,\"markets\":[{\"id\":10,\"tag_type\":\"MarketTag\",\"name\":\"SaaS\",\"display_name\":\"SaaS\",\"angellist_url\":\"https://angel.co/saas\"},{\"id\":321,\"tag_type\":\"MarketTag\",\"name\":\"finance\",\"display_name\":\"Finance\",\"angellist_url\":\"https://angel.co/finance\"},{\"id\":856,\"tag_type\":\"MarketTag\",\"name\":\"venture capital\",\"display_name\":\"Venture Capital\",\"angellist_url\":\"https://angel.co/venture-capital\"},{\"id\":15805,\"tag_type\":\"MarketTag\",\"name\":\"angel investing\",\"display_name\":\"Angels\",\"angellist_url\":\"https://angel.co/angel-investing\"}],\"locations\":[{\"id\":1648,\"tag_type\":\"LocationTag\",\"name\":\"indianapolis\",\"display_name\":\"Indianapolis\",\"angellist_url\":\"https://angel.co/indianapolis\"}],\"company_type\":[],\"status\":{\"id\":109814,\"message\":\"Early stage investors & startups, version 1.0 of Visible is ready to rock. Contact Mike (mike@visible.vc) for more info or to get a demo. \",\"created_at\":\"2013-09-24T04:04:56Z\"},\"screenshots\":[{\"thumb\":\"https://s3.amazonaws.com/screenshots.angel.co/9d/82745/c9ab52c4ccb7a68d3a6a5082c2dbff91-thumb_jpg.jpg\",\"original\":\"https://s3.amazonaws.com/screenshots.angel.co/9d/82745/c9ab52c4ccb7a68d3a6a5082c2dbff91-original.png\"},{\"thumb\":\"https://s3.amazonaws.com/screenshots.angel.co/9d/82745/bc7b1217eeab29f97f3eabf21bb0309b-thumb_jpg.jpg\",\"original\":\"https://s3.amazonaws.com/screenshots.angel.co/9d/82745/bc7b1217eeab29f97f3eabf21bb0309b-original.png\"},{\"thumb\":\"https://s3.amazonaws.com/screenshots.angel.co/9d/82745/3dcdbee28dbd037999742b4027aa6fdb-thumb_jpg.jpg\",\"original\":\"https://s3.amazonaws.com/screenshots.angel.co/9d/82745/3dcdbee28dbd037999742b4027aa6fdb-original.png\"}]}"
	end

	describe "#url_parser" do
      it "should parse the url down to the domain" do
        url_parser(@url).should eq("visible.vc")
	  end
	end  

	describe '#is_state?'  do
	  it "should return true if it is a state" do
        is_state?("Georgia").should eq(true)
	  end	
	end

	describe '#find_location'  do
	  it "should return the state of a city " do
        find_location(@hash).should eq("California")
	  end	
	end	

	describe '#grab_markets'  do
	  it "should return return an array of markets " do
        grab_markets(@markets).should eq(["SaaS", "Finance"])
	  end	
	end

	describe '#grab_markets'  do
	  it "should return return an array of markets " do
        grab_markets(@markets).should eq(["SaaS", "Finance"])
	  end	
	end	

	describe '#make_friendly_url'  do
	  it "should return a fixed url if the first attempt is a 404 " do
        fixed = url_parser(@url)
        make_friendly_url(fixed).first.should eq(@response_string)
	  end	

      it "should return an array" do
        make_friendly_url("nonsense").should eq({message: "Url not found"})
      end

	end




end