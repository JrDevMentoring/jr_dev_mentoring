class ProfilesController < AuthenticationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :only_current_user

  def new
    @profile = Profile.new
  end

  def create
    @profile = @user.build_profile(profile_params)
    if @profile.save
      flash[:success] = "Profile Updated!"
      redirect_to user_path( @user )
    else
      flash[:danger] = "An error occurred and your profile has not been updated. You must complete all form fields."
      render action: :new
    end
  end

  def edit
    @profile = @user.profile
  end

  def update
    @profile = @user.profile
    if @profile.update_attributes(profile_params)
     flash[:success] = "Profile Updated!"
      redirect_to user_path( params[:user_id] )
    else
      # binding.pry
     render action: :edit
    end
  end

  private
  def profile_params
    # Remove the extra blank introduced by rails collection_check_boxes
    params[:profile][:plan_types].reject!{|f| f.blank?}

    params.require(:profile)
      .permit(:not_available, :first_name, :last_name, :avatar, :contact_email, :city, :state,
              :country, :coding_languages, :bio, :mentoring_needs, plan_types: [])
  end

  def only_current_user
    redirect_to(root_url) unless @user == current_user
  end

  def set_user
    @user = User.find( params[:user_id] )
  end
end
