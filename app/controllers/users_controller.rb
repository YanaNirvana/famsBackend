class UsersController < ApplicationController
  skip_before_action :authorized, only: :create
  # before_action :authorized, only: [:destroy, :profile]

  def create
    user = User.create(user_params)
    if user.valid?
      token = encode_token(user_id: user.id)
      render json: { user: UserSerializer.new(user), jwt: token }, status: :created
    else
      render json: user.errors.full_messages, status: :not_acceptable
    end
  end

  def profile
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end

  def destroy
    render json: User.destroy(params[:id])
  end


  private

  def user_params
    params.require(:user).permit(:username, :password, :name)
  end

end
