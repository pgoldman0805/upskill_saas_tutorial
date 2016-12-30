class ProfilesController < ApplicationController
  # GET request to /users/:user_id/profile/new
  def new
    # Render a blank profile details form
    @profile = Profile.new
  end
  
  # POST requests to /users/:user_id/profile
  def create
    
    # Ensure that we have the user who is filling out the form
    @user = User.find(params[:user_id]) #grabs the user_id
    
    # Create profile linked to this specific user
    @profile = @user.build_profile(profile_params)
    if @profile.save
      flash[:success] = "Profile udpated!"
      redirect_to root_url
    else
      render action: :new
    end
  end
  
  # Whitelist the form fields to be submitted
  private
  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :job_title, :phone_number, :contact_email, :description)
  end
end