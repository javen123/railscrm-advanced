class Admin::UsersController < ApplicationController
  def new
    @organization = Organization.find params[:organization_id]
    @user = User.new
  end

  def create
    binding.pry
    org = Organization.find params[:user][:organization_id]
    @user = User.create params[:user]
    org.users << @user
    redirect_to organization_path(org)
  end
end
