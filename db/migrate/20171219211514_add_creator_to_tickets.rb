class AddCreatorToTickets < ActiveRecord::Migration[5.1]
  def change
    add_column :tickets, :creator, :integer
  end
end
