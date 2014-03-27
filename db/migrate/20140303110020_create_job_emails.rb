class CreateJobEmails < ActiveRecord::Migration
  def change
    create_table :job_emails do |t|
      t.string :email
      t.integer :job_id

      t.timestamps
    end
  end
end
