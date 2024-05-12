# frozen_string_literal: true

class ShelteredsController < ApplicationController
  def index
    @sheltereds = current_user.organization.sheltereds
  end

  def new
    @sheltered = Sheltered.new
  end

  def edit
    @sheltered = current_user.organization.sheltereds.find(params[:id])
  end

  def create
    @sheltered = current_user.organization.sheltereds.new(sheltered_params)
    if @sheltered.save
      redirect_to sheltereds_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @sheltered = current_user.organization.sheltereds.find(params[:id])
    if @sheltered.update(sheltered_params)
      redirect_to sheltereds_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def sheltered_params
    params.require(:sheltered).permit(
      :name,
      :document,
      :birthdate,
      :gender,
      :children_in_house,
      :adults_in_house,
      :animals_in_house,
      :house_status,
      :street,
      :street_number,
      :district,
      :city,
      :government_assist,
      :cadunico,
      :special_needs,
      :medications,
    )
  end
end
