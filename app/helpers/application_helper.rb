module ApplicationHelper
	def url_parser(url)
      url_protocol = URI.parse(url).host
      if url_protocol
      	company_name = url_protocol.gsub(/^www\./, '')
      else
        no_protocol = url.gsub(/^www\./, '')
      end	

	end	
end
# 