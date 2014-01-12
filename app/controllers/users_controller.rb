# coding: utf-8
class UsersController < Clearance::UsersController
  before_action :set_user, only: [:edit, :destroy, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_url, notice: "Użytkownik został pomyślnie dodany"
    else
      render action: 'new'
    end
  end

  def index
    @users = User.all    
  end

  def destroy
  	@user.destroy
  	redirect_to users_url
  end

  def edit
    
  end

  def update
    p params
    p @user
    @user.update(user_params)
    p @user
    redirect_to users_url
  end

  private
  
  def set_user
    @user = User.find params[:id]
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  # stupid!;/
  def avoid_sign_in
  end
end