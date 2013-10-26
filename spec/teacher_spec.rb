require 'rspec'
require 'faker'
require_relative '../app/models/teacher'
require_relative '../app/models/student'



describe Teacher, "testing active record" do

  before(:each) do
    raise RuntimeError, "be sure to run 'rake db:migrate' before running these specs" unless ActiveRecord::Base.connection.table_exists?(:students).should be_true
    Teacher.delete_all
  end

  it "should create 9 teachers" do
    9.times do 
      Teacher.create({:name =>  Faker::Name.name, :email => Faker::Internet.email })
    end

    # p Teacher.first
    # p Teacher.last

    Teacher.all.count.should == 9
  end

  it "should not allow 2 of the same e-mail addresses" do
    email = 'asdf@asdf.com'
    sam = Teacher.create({:name => 'sam', :email =>  email })
    bert = Teacher.create({:name => 'bert', :email => email })

    # p Teacher.first
    # p Teacher.last
    
    Teacher.all.count.should == 1
  end

  it "should verify students can have multiple teachers" do
    sam = Teacher.create({:name => 'sam', :email =>   Faker::Internet.email})
    bert = Teacher.create({:name => 'bert', :email =>  Faker::Internet.email})
    mike = Teacher.create({:name => 'Mike', :email => Faker::Internet.email})

    Student.all.each do |student|
      teachers = Teacher.all.shuffle
      student.teachers << teachers.first
      student.teachers << teachers.second
      student.save
    end


    # # Teacher.where("name = ?", 'sam')
    # p Teacher.find_by_name('sam').students.count
    # p Teacher.find_by_name('bert').students.count
    # p Teacher.find_by_name('Mike').students.count
    
    Student.first.teachers.count.should > 1 
  end

  it "given a teacher, I can list it's students" do
    sam = Teacher.create({:name => 'sam', :email =>   Faker::Internet.email})
    bert = Teacher.create({:name => 'bert', :email =>  Faker::Internet.email})
    mike = Teacher.create({:name => 'Mike', :email => Faker::Internet.email})

    Student.all.each do |student|
      teachers = Teacher.all.shuffle
      student.teachers << teachers.first
      student.teachers << teachers.second
      student.save
    end

    Teacher.first.students.count.should > 1 
  end

end