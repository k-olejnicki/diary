class EntriesController < ApplicationController
  def index
    @entries = Entry.where(["date <= ?" , Date.today])
  end
  def show
    @entry = Entry.find(params["id"])
  end
  def new
    @entry= Entry.new
  end
  def create
    entry_params = params["entry"].permit("title","image","contents")
    entry = Entry.create(entry_params)
    redirect_to(entry_path(entry))
  end
  def edit
    @entry = Entry.find(params["id"])
  end
  def update
    entry_params = params["entry"].permit("title", "date" , "image", "youtube_url" , "youtube_embed" ,"contents")
    entry = Entry.find(params["id"])
    entry.update_attributes(entry_params)
    redirect_to(entry_path(entry))
  end
  def destroy
    @entry = Entry.find(params["id"])
    @entry.destroy
    redirect_to entries_url notice: "Entry was succesfully destroyed"
  end
  def date
    time = Time.new

    values = time.to_a
    puts Time.utc(*values)
  end
  end
