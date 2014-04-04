class VoteMailer < ActionMailer::Base
  default from: MAIL['user_name']

  def confirmation(vote)
    @vote = vote
    mail(to: @vote.email, subject: 'Welcome to My Awesome Site')
  end
end
