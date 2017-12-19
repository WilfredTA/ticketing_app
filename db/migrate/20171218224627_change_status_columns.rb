class ChangeStatusColumns < ActiveRecord::Migration[5.1]
  def change
    drop_table :statuses

    create_table :statuses do |t|
      t.string :name
    end
  end
end
