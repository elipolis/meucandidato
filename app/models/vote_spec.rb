require 'spec_helper'

describe Vote do
	subject ( build(:vote) )
	describe "#sum_unique_candidate" do
		subject(:candidate) { create(:candidate) }
		let!(:votes) 		{ create_list(:vote, 3, candidate: candidate) }
		it { expect(candidate.number_of_unique_votes).to eq 3 }
	end	
	
end