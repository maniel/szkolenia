class UsersController < Clearance::UsersController
  def index
    @users = User.all    
  end

  def destroy
  	@user = User.find params[:id]
  	@user.destroy
  	respond_to do |format|
  		format.html { redirect_to users_url }
    end
  end
end