class Admin::OrganizationsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :verify_is_admin, only: [:index, :new, :create, :destroy]
  layout 'admin'
  
  def index
    @organizations = Organization.all
  end

  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.create params[:organization]
    if @organization.save
      redirect_to admin_path, flash: { notice: 'Organization successfully created'}
    else
      render :new
    end
  end

  def show
    @organization = Organization.find params[:id]
  end

  def update
    @organization = Organization.find params[:id]
    if @organization.update_attributes params[:organization]
      redirect_to admin_organization_path @organization, flash[:notice] = 'Organization successfully updated'
    else
      render :edit
    end
  end

  def destroy
    @organization = Organization.find params[:id]
    if @organization.destroy
      flash[:notice] = 'Organization Deleted'
      redirect_to :back
    else
      flash[:error] = 'Organization could not be deleted'
      redirect_to :back
    end
  end

private
  def verify_is_admin
    (current_user.nil?) ? redirect_to(root_path) : (redirect_to(organization_path) unless current_user.admin?)
  end

end
