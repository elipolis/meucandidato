class Candidate
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  field :name, 	 type: String
  field :symbol, type: String

  field :number_of_unique_votes, type: Integer, default: 0

end
