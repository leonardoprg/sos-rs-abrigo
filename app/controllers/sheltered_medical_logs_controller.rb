# frozen_string_literal: true

class ShelteredMedicalLogsController < ApplicationController
  before_action :load_sheltered

  def create
    @sheltered_medical_log = @sheltered.sheltered_medical_logs.new(
      # TODO: add acts_as_tenant
      sheltered_medical_log_params.merge(organization_id: current_user.organization_id)
    )
    @sheltered.save!
  end

  private

  def load_sheltered
    @sheltered = current_user.organization.sheltereds.find(params[:sheltered_id])
  end

  def sheltered_medical_log_params
    params.require(:sheltered_medical_log).permit(
      :description
    )
  end
end
