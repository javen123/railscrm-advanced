class Organization
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name 
  field :phone   
  field :address
  field :city
  field :state
  field :zip 

  has_many :users

end
