class Note
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :content
  
  belongs_to :lead
end
