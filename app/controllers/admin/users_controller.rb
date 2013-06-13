class Admin::UsersController < ApplicationController

  def new
    @organization = Organization.find params[:organization_id]
    @user = User.new
  end

  def create
    org = Organization.find params[:user][:organization_id]
    @user = User.create params[:user]
    if @user.save
      org.users << @user
      redirect_to admin_organization_path(org), flash: { notice: 'Successfully added new user'}
    else
      redirect_to admin_organization_path(org), flash: { notice: 'Unable to  add new user'}
    end
  end

  def edit
    @user = User.find params[:id]
    @organization = Organization.find params[:org_id]
  end

  def update
    org = Organization.find params[:user][:organization_id]
    @user = User.find params[:id]
    @user.update_attributes params[:user]
    if @user.save
      redirect_to admin_organization_path(org), flash: { notice: 'Successfully updated user'}
    else
      redirect_to admin_organization_path(org), flash: { notice: 'Unable to update user'}
    end
  end

  def destroy
    org = Organization.find params[:org_id]
    @user = User.find params[:id]
    if @user.destroy
      redirect_to admin_organization_path(org), flash: { notice: 'Successfully deleted user'}
    else
      redirect_to admin_organization_path(org), flash: { notice: 'Unable to delete user'}
    end
  end

end
