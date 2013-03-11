class AccountsController < PublicController
  
	def index
		@accounts = current_user.organization.accounts
	end
  
	def new
		@account = Account.new
    @lead_owner = current_user.organization.users.map(&:email)
	end

	def show
		@account = Account.find params[:id]
    @lead_owner = current_user.organization.users.map(&:email)
	end

	def create
    @account = Account.create params[:account]
    if @account.save
      redirect_to accounts_path, flash: { notice: 'New Account Created'}
    else
      render :new
    end
	end

	def update
		@account = Account.find params[:id]

		 if @account.update_attributes params[:account]
      redirect_to account_path @account, flash[:notice] = 'Account Updated'
    else
      render :edit
    end
  end

	def destroy
    @account = Account.find params[:id]
    if @account.destroy
      flash[:notice] = 'Account Deleted'
      redirect_to :back
    else
      flash[:error] = 'Account could not be deleted'
      redirect_to :back
    end
	end
end
