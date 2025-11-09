class UsersController < ApplicationController

  def index
    @user = User.find_by(id: session[:id])
  end

  def new
    @user = User.new
    @user.icon = "https://rails-02-sample.herokuapp.com/assets/common/default-avatar-7a6cbfd7993e89f24bfc888f4a035a83c6f1428b8bdc47eed9095f2799a40153.png"
  end

  def create
    @user = User.new(params.require(:user).permit(:name, :email, :password, :conf_password, :icon))
    if @user.save
      redirect_to users_login_path
    else
      flash[:notice] = "ユーザーの登録に失敗しました。"
      render "new", status: :unprocessable_entity
    end
  end

  def edit_account
    @user = User.find(id: session[:id])
  end

  def edit_profile
    @user = User.find(id: session[:id])
  end

  def update_account
    @user = User.find_by(email: session[:email])
    if @user.update(params.require(:user).permit(:email, :password, :conf_password))
      flash[:notice] = "アカウントの情報を更新しました"
      flash[:notice] = "アカウントの編集に成功しました。"
      redirect_to users_path
    else
      flash[:notice] = "アカウントの編集に失敗しました。"
      render "edit", status: :unprocessable_entity
    end
  end

  def update_profile
    @user = User.find_by(email: session[id])
    if @user.update(params.require(:user).permit(:icon, :name, :introduction))
      flash[:notice] = "アカウントの情報を更新しました"
      flash[:notice] = "アカウントの編集に成功しました。"
      redirect_to users_path
    else
      flash[:notice] = "アカウントの編集に失敗しました。"
      render "edit", status: :unprocessable_entity
    end
  end

  def login
    @user = User.find_by(id: params[:id])

    if @user && @user.password == params[:password]
      session[:id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to reservations_path
    else
      session[:id] = nil
      flash[:notice] = "ログインに失敗しました"

      render :login, status: :unprocessable_entity
    end
  end

  def logout
    @user = User.find_by(id: params[:id])
    session[:id] = nil
  end

end