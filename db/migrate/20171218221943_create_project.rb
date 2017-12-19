class CreateProject < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
    end
  end
end
