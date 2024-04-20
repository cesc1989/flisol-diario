class EntriesController < ApplicationController
  def new
    @entry = Entry.new
  end

  def index
    @entries = current_user.entries
  end

  def create
    @entry = Entry.new(entry_params)
    @entry.user = current_user

    if @entry.save
      redirect_to entries_path
    else
      render :new
    end
  end

  private

  def entry_params
    params.require(:entry).permit(:content)
  end
end
