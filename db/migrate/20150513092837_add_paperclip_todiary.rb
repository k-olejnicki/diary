class AddPaperclipTodiary < ActiveRecord::Migration
  def change
    add_attachment :entries, :image
  end
end
