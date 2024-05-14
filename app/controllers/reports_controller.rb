# frozen_string_literal: true

class ReportsController < ApplicationController
  layout 'report'

  def sheltereds
    @sheltereds = current_user.organization.sheltereds.order(:name)
  end
end
