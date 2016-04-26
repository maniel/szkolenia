# coding: utf-8
class UsersController < Clearance::UsersController
  before_action :set_user, only: [:edit, :destroy, :update]
#  before_action :authorize
  # before_action :check_role, only: [:new, :create, :index, :destroy, :edit, :update]


  def new
    @user = User.new
    @user.admin = false
    @user.doradca = false
  end

  def create
    u_params = user_params
    prepare_params(u_params)
    @user = User.new(u_params)
    if @user.save
      redirect_to users_url, notice: "Użytkownik został pomyślnie dodany"
    else
      render action: 'new'
    end
  end

  def index
    if current_user.admin?
      @users = User.all.order(:email)
    else
      @users = User.all.order(:email) - User.with_role(:admin) - User.with_role(:doradca, User)
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
    prepare_params(u_params)
    @user.update(u_params)
    redirect_to users_url
  end

  def edycjakonta
    @user = current_user
  end

  private

  def prepare_params(u_params)
    [:admin, :doradca].each do |k|
      if u_params[k] == '1'
        u_params[k] = true
      else
        u_params[k] = false
      end
    end
  end

  def set_user
    @user = User.find params[:id]
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :admin, :doradca)
  end

  def check_role
    raise ActionController::RoutingError.new('Not Found') unless current_user.admin? or current_user.doradca?
  end

  # stupid!;/
  def avoid_sign_in
  end
end
