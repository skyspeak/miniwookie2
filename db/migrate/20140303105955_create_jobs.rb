class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :name
      t.string :stage
      t.date :date
      t.text :comments
      t.timestamps
    end
  end
end
