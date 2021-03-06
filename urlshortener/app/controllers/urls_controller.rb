require "securerandom"
require "csv"

class UrlsController < ActionController::Base

	def redirect
    urldata = CSV.read('/tmp/urldata.txt').to_h
    if urldata.has_key?(params[:id])
      redirect_to urldata[params[:id]]
    else
      render 'bad_link'
    end
  end

	def url_result
		render 'url_result'
	end

	def do_shorten
		urlhash = CSV.read('/tmp/urldata.txt').map(&:reverse).to_h
		if urlhash.has_key?(params[:url_to_shorten]) 				
			session[:cryptic_id] = urlhash[params[:url_to_shorten]]		
		else
			session[:cryptic_id] = SecureRandom.hex[0..5]
			CSV.open('/tmp/urldata.txt', 'a') do |csv|
	 			csv << [session[:cryptic_id], params[:url_to_shorten]]
			end			

		end		
		redirect_to '/url_result'
	end
end
