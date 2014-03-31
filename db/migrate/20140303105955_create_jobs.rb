class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :name
      t.string :stage
      t.string :category
      t.string :country
      t.date :start_date
      t.date :end_date
      t.timestamps
    end
  end
end
