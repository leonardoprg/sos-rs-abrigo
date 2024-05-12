# frozen_string_literal: true

class VolunteersController < ApplicationController
  def index
    @volunteers = current_user.organization.users
  end

  def new
    @volunteer = User.new
  end

  def edit
    @volunteer = current_user.organization.users.find(params[:id])
  end

  def create
    @volunteer = current_user.organization.users.new(user_params)
    if @volunteer.save
      redirect_to volunteers_path
    else
      render :new
    end
  end

  def update
    @volunteer = current_user.organization.users.find(params[:id])
    if @volunteer.update(user_params)
      redirect_to volunteers_path
    else
      render :edit
    end
  end

  private

  # rubocop:disable Metrics/MethodLength
  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation,
      :document,
      :phone_number,
      :street,
      :street_number,
      :district,
      :city,
      :email,
      :password,
      :password_confirmation,
      :role_id,
      work_shifts: []
    )
  end
  # rubocop:enable Metrics/MethodLength
end
