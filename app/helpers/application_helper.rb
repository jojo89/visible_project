module ApplicationHelper

	def url_parser(url)
      url_protocol = URI.parse(url).host
      if url_protocol
      	company_name = url_protocol.gsub(/^www\./, '')
      else
        no_protocol = url.gsub(/^www\./, '')
      end	
	end	


    def is_state?(locale)
      states =[ "Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware", "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"]
      states.include?(locale)
    end	

    def find_location(hash)
      locale_id = hash["locations"].first["id"].to_s
      finished = false
      while finished == false
	    response = "https://api.angel.co/1/tags/"+locale_id +"/parents" 
	    string = open(response).first
	    location = JSON.parse(string)
	    locale = location["parents"].first["display_name"]
	    locale_id = location["parents"].first["id"].to_s
	    if is_state?(locale)
	      finished = true	
	      locale
	    else
	      false  
	    end
	  end  
	  locale
    end


    def grab_markets(markets)
      array = []
      markets.each do |h|
        array << h["display_name"]
      end  
      array
    end	

end
# 