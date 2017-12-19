class CreateStatus < ActiveRecord::Migration[5.1]
  def change
    create_table :statuses do |t|
      t.string :new
      t.string :blocked
      t.string :in_progress
      t.string :fixed
    end
  end
end
