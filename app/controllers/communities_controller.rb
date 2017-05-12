class CommunitiesController < AuthenticationController
  def index
    if params[:query].present?
      @available_mentors = Profile.mentors.search_for(params[:query]) if current_user.mentee?
      @available_mentees = Profile.mentees.search_for(params[:query]) if current_user.mentor?
    else
      @available_mentors = Profile.mentors if current_user.mentee?
      @available_mentees = Profile.mentees if current_user.mentor?
    end
  end
end