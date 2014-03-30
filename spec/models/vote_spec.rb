require 'spec_helper'

describe Vote do
	subject(:vote) { build(:vote) }

	describe "#sum_unique_candidate" do
		let(:candidate)       { create(:candidate) }
		let!(:votes) 	        { create_list(:vote, 2, candidate: candidate) }
		before :each do
			votes.each { |vote| vote.active! vote.email_hash }
		end

		it "increments the number of candidate votes" do
      expect(candidate.number_of_unique_votes).to eq 2 
    end
  end

	describe "#generate_validator!" do
    subject(:vote) { create(:vote) }

		it { expect(vote.email_hash).to_not be_nil }
	end

	describe "#active!" do
    subject(:vote)         { create(:vote, candidate: candidate) }
    let!(:candidate)       { create(:candidate) }
    let!(:candidate_votes) { candidate.number_of_unique_votes }
    
    context "when secret key is valid" do
      before :each do
        Timecop.freeze
        vote.active! vote.email_hash
      end

      it "expects status be truthy" do
       expect(vote.status).to be_truthy
      end
      it "expects incremente candidate votes" do
       expect(candidate.number_of_unique_votes).to eq(candidate_votes+1)  
      end
      it "expects be time.now" do 
        expect(vote.activeted_at).to eq Time.now 
      end
    end

    context "when secret key is invalid" do
      it { expect{ vote.active! "hashfusuhhsu" }.to raise_error(ArgumentError) }
    end
		
	end
	
  describe "#validation!" do
    xit {}
  end
end