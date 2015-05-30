class WelcomeController < ApplicationController
  def index
  	@entry= Entry.new
  	@entries = Entry.all
    @website= Website.new
    @websites= Website.all

  end
end
