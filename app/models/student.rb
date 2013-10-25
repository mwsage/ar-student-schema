require_relative '../../db/config'

class Student < ActiveRecord::Base
# implement your Student model here

    validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
      #:message => "did not provide the proper email format" }
    validates :email, :uniqueness => true
    validates :age, :numericality => {:greater_than => 5}
    validates :phone, :format => { :with => /.*\d{3}.*\d{3}.*\d{4}.*/}

  def name
    #Students.all.each do |student|
      #student.name = [student.first_name, student.last_name].join('')
      #student.save
    #end
    first_name + " " + last_name
  end

  def age
   Time.now.year - birthday.year
  end


end




