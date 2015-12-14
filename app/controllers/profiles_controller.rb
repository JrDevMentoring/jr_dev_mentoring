class ProfilesController < ApplicationController
  def new
    # form where a user can fill out their own profile.
    @user = User.find( params[:user_id] )
    @profile = Profile.new
  end
  def create 
    @user = User.find( params[:user_id] )
    @profile = @user.build_profile(profile_params)
    if @profile.save
      flash[:success] = "Profile Updated!"
      redirect_to user_path( @user )
    else
        flash[:danger] = "An error occured and your profile has not been updated. You must complete all form fields."
        render action: :new
    end
  end
  def edit
    @user = User.find( params[:user_id] )
    @profile = @user.profile
  end
  def update
    @user = User.find( params[:user_id] )
    @profile = @user.profile
    if @profile.update_attributes(profile_params)
     flash[:success] = "Profile Updated!"
      redirect_to user_path( params[:user_id] )
    else
     render action: :edit
    end
  end
  private
    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :contact_email, :city, :state, :country, :coding_languages, :bio, :mentoring_needs)
    end
end