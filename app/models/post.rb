class Post < ActiveRecord::Base
  has_many :comments
  validates :title, presence: true, length: {minimum: 5}
  validates :text,  presence: true 
 end
