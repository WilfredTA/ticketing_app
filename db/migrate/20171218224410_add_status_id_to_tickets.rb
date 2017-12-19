class AddStatusIdToTickets < ActiveRecord::Migration[5.1]
  def change
    drop_table :tickets

    create_table :tickets do |t|
      t.string :name
      t.text :body
      t.integer :status_id
      t.integer :project_id
    end
  end
end
