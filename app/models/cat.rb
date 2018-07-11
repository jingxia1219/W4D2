class Cat < ApplicationRecord
  COLORS = ['black', 'orange', 'white', 'pattern', 'stripe', 'gray','other']
  GENDERS = ['M', 'F']
  
  validates :name, :sex, :description, :color, :birth_date, presence: true
  validates :color, inclusion: COLORS 
  validates :sex, inclusion: GENDERS
  
  def age
    years = Time.now.year - self.birth_date.year 
    months = Time.now.month - self.birth_date.month 
    if months < 0 
    months += 12 
    years -=1 
    end 
    "#{self.name} is #{years} years and #{months} months old."
  end
  
  has_many :rentals,
  foreign_key: :cat_id,
  class_name: :CatRentalRequest
  dependent: :destroy
end