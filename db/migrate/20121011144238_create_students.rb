require_relative '../config'

# this is where you should use an ActiveRecord migration to 

class CreateStudents < ActiveRecord::Migration
  def change
    # HINT: checkout ActiveRecord::Migration.create_table
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string  :gender
      t.date :birthday
      t.string :email
      t.string :phone

      t.timestamps
      # t.datetime :created_at
      # t.datetime :updated_at
    end
  end
end
    #   :integer => ["id"],
    #   :string => ["first_name", "last_name", "gender", "email", "phone"],
    #   :date => ["birthday"],
    #   :datetime => ["created_at", "updated_at"]
    # }

# class AddNameColumn < ActiveRecord::migration
#   def up
#     add_column :student :name, :string, default: ''

#     Students.all.each do |student|
#       student.name = [student.first_name, student.last_name].join('')
#       student.save
#     end

#     remove_column :first_name
#     remove_column :last_name
#   end

#   def down
#     add_column :student :first_name, :string, default: ''
#     add_column :student :last_name, :string, default: ''
  
#     Students.all.each do |student|
#       student.first_name, student.last_name = student.name.split('')
#       student.save
#     end
#   remove_column :student :name 
#   end
# end