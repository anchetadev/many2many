class SessionsController < ApplicationController

  # check email and password, since password is hashed must check the hashed password not plain text
  def create
    @user = User.find_by_email(params[:l_Email])
    if @user && @user.authenticate(params[:l_Password])
      session[:user_id] = @user.id   
      flash[:notice] = ["Welcome #{@user.name}"]   
      # @user = current_user 
      # return redirect_to "/users/#{session[:user_id]}"
      return redirect_to "/bright_ideas"
      # redirect_to 'users/@user.id'
    # end
    else
      flash[:errors] = ["Invalid Combination"]
      return redirect_to '/main'
    end
      # Log User In
      # if authenticate true
          # save user id to session
          # redirect to users profile page
      # if authenticate false
          # add an error message -> flash[:errors] = ["Invalid"]
          # redirect to login page
  end
  def destroy
    User.find(session[:user_id])
    session[:user_id] = nil
    redirect_to '/main'
      # Log User out
      # set session[:user_id] to null
      # redirect to login page
  end
end
