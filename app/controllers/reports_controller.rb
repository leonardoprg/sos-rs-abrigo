# frozen_string_literal: true

class ReportsController < ApplicationController
  layout 'report'

  def sheltereds
    @sheltereds = current_user.organization.sheltereds.active.order(:name)
  end
end
