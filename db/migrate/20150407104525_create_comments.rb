class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :nick
      t.text :contents
      t.references :entry

      t.timestamps null: false
    end
  end
end
