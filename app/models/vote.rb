class Vote
  include Mongoid::Document
  include Mongoid::Timestamps

  # field component
  field		   :email
  field      :status,          type: Boolean, default: false
  field      :activeted_at,    type: DateTime
  field 	   :confirmation,    type: Boolean, default: false
  field      :confirmation_at, type: DateTime
  field 	   :email_hash,      type: String
  has_one    :candidate
  embeds_one :candidate

  validates :email, uniqueness: true, presence: true

  # Callbacks
  before_create :generate_validator!
  after_create  :confirmation!

  def sum_unique_candidate!
  	self.candidate.inc number_of_unique_votes: 1
  end

  def generate_validator!
  	self.email_hash = Digest::SHA1.hexdigest("#{self.email}#{Faker::Number.number(256)}")
  end

  def active! secret_key
  	if email_hash == secret_key 
      self.update_attributes!(status: true, activeted_at: Time.now)
      sum_unique_candidate!
    else
     raise ArgumentError.new "Secret key is invald"
   end
  end

  def confirmation!
    # TODO Make this asynchronous
    if VoteMailer.confirmation(self).deliver
      self.update_attributes confirmation: true, confirmation_at: Time.now
    end
  end
end

