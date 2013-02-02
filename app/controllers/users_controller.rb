class UsersController < ApplicationController
  before_filter :authenticate_user!#, only: :index

  def dashboard
    @leads = Lead.where(lead_owner: current_user.email).to_a
    @tasks = Task.where(assigned_to: current_user.email).to_a
  end

  def destroy
    @user = User.find params[:id]
    if @user.destroy
      redirect_to :back, flash: { notice: 'User has successfully been deleted'}
    else
      redirect_to :back, flash: { notice: 'Unable to delete user'}
    end 
  end

end