class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.string :name
      t.text :body
      t.string :status
      t.integer :project_id
    end
  end
end
