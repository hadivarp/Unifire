class BaseController < ApplicationController
  skip_before_action :verify_authenticity_token#, only: [:create, :update, :destroy]
  before_action :authenticate_user

  private

  def authenticate_user
    token = request.headers['Authorization']&.split(' ')&.last
    decoded_token = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
    @current_user = User.find(decoded_token['user_id'])
  rescue JWT::DecodeError
    render json: { message: 'Unauthorized' }, status: :unauthorized
  end




end
