class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.integer :ticket_id
      t.integer :creator_id
      t.text :body
    end
  end
end
