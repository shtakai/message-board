class Message < ActiveRecord::Base
  
  # name is mandatory, and maximum 20chars
  validates :name, length: {maximum: 20}, presence: true 
  
  # and body is also mandatory, 2-30 chars
  validates :body, length: {minimum: 2, maximum: 30}, presence: true
  
  # age is mandatory, greater than equal to 0
  validates :age,
    numericality: {
      only_integer: true,
      greater_than_or_equal_to: 0
    },
    presence: :true
  
end
