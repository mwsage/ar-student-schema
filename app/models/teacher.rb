require_relative '../../db/config'

class Teacher < ActiveRecord::Base
  has_and_belongs_to_many :students

  validates :email, uniqueness: true
end