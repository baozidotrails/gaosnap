class Dog < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true
  has_many :stories
end
