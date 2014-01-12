# coding: utf-8
class UsersController < Clearance::UsersController
  before_action :set_user, only: [:edit, :destroy, :update]
  before_action :authorize, only: [:new, :create, :index, :destroy, :edit, :update]

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
    if current_user.admin?
      @users = User.all
    else
      @users = User.all.select {|user| !user.admin? && !user.doradca? }
    end
  end

  def destroy
  	@user.destroy
  	redirect_to users_url
  end

  def edit
    
  end

  def update
    u_params = user_params
    [:admin, :doradca].each do |k|
      if u_params[k] == '1'
        u_params[k] = true
      else
        u_params[k] = false
      end
    end
    @user.update(u_params)
    redirect_to users_url
  end

  private
  
  def set_user
    @user = User.find params[:id]
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :admin, :doradca)
  end

  # stupid!;/
  def avoid_sign_in
  end
end