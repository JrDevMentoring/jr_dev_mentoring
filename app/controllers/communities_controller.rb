class CommunitiesController < AuthenticationController
  def index
    @available_mentors = User.mentors if current_user.mentee?
    @available_mentees = User.mentees if current_user.mentor?
  end
end