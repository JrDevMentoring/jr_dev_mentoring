class CommunitiesController < AuthenticationController
  def index
    @available_mentors = User.mentors unless current_user.mentor?
    @available_mentees = User.mentees unless current_user.mentee?
  end
end