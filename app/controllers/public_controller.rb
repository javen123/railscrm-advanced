class PublicController < ApplicationController
  before_filter :authenticate_user!
  before_filter :redirect_admin
end
