# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @sheltereds = current_user.organization.sheltereds.active
  end
end
