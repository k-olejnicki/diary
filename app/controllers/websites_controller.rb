class WebsitesController < ApplicationController
	def index
  		@websites = Website.all
	 end
	 def show
  		@website = Website.find(params["id"])
	 end
	 def new
	 	@website= Website.new(url: "http://", title: "Witryna ")
	 end
	 def create
  		website_params = params["website"].permit("title", "url")
  		website = Website.create(website_params)
  		redirect_to(website_path(website))
	 end
	 def edit
  		@website = Website.find(params["id"])
	 end
	 def update
  		website_params = params["website"].permit("title","url")
  		website = Website.find(params["id"])
  		website.update(website_params)
  		redirect_to(website_path(website))
	 end
	 def destroy
	 	@website = Website.find(params["id"])
	 	@website.destroy
	 	redirect_to websites_url notice: "Website was succesfully destroyed"
	 end
end
