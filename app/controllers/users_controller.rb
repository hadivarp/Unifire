class UsersController < BaseController
  before_action :set_users, only: [:index, :show, :destroy, :update]

  def create
    user = User.new(user_params)

    if user.save
      render json: { message: 'User created successfully', user: user }, status: :created
    else
      render json: { message: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def index
    render json: @users, status: :ok
  end

  def show
    user = @users.find_by(uid: params[:uid])

    if user.nil?
      render json: { message: 'User not found' }, status: :not_found
    else
      render json: { user: user }, status: :ok
    end
  end

  def destroy
    user = @users.find_by(uid: params[:uid])

    if user
      user.update(deleted_at: Time.now)
      render json: { message: 'User deleted successfully' }, status: :ok
    else
      render json: { message: 'User not found' }, status: :not_found
    end
  end

  def update
    user = @users.find_by(uid: params[:uid])

    if user && user.update(user_params)
      render json: { message: 'User updated successfully', user: user }, status: :ok
    else
      render json: { message: user ? user.errors.full_messages : 'User not found' }, status: :not_found
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone_number, :password, :password_confirmation)
  end

  def set_users
    @users = User.all
  end
end