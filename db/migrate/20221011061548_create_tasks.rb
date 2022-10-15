class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.date :start, null: false
      t.date :finish, null: false
      t.boolean :allday

      t.timestamps
    end
  end
end
