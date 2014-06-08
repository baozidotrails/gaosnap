class Story < ActiveRecord::Base
  validates :title, presence: true
  validates :content, presence: true
  belongs_to :dog
end
