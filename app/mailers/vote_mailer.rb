class VoteMailer < ActionMailer::Base
  default from: "from@example.com"

  def confirmation(vote)
    mail(to: vote.email, subject: 'Welcome to My Awesome Site')
  end
end
