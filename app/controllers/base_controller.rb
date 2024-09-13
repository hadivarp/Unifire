class BaseController < ApplicationController
  skip_before_action :verify_authenticity_token#, only: [:create, :update, :destroy]
end
