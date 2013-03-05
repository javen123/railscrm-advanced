class AdminController < ApplicationController
  
  def dashboard
    @organizations = Organization.all
  end

end
