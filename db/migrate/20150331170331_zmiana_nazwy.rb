class ZmianaNazwy < ActiveRecord::Migration
  def change
  	rename_column :entries, :content, :contents
  end
end
