class CommunitiesController < AuthenticationController
  def index
    @available_mentors, @available_mentees = [], []

    @available_mentors = User.mentors if current_user.mentor?
    @available_mentees = User.mentees if current_user.mentee?
  end
end