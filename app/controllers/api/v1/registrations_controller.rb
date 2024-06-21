class Api::V1::RegistrationsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  skip_before_action :authenticate_user, only: [:create]

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.json { render json: { success: "Success Create" }, status: :ok }
      else
        format.json do
          render json:   { error: @user.errors.full_messages.join(", ") },
                 status: :unprocessable_entity
        end
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :password, :gender,
                                 :password_confirmation)
  end
end
