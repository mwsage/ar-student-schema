require_relative '../config'

# this is where you should use an ActiveRecord migration to 

class CreateTeachers < ActiveRecord::Migration
  def change
    # HINT: checkout ActiveRecord::Migration.create_table
    create_table :teachers do |t|
      t.string :name
      t.string :address
      t.string :email
      t.string :phone


      t.timestamps
      # t.datetime :created_at
      # t.datetime :updated_at
    end
  end
end