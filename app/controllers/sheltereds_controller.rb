# frozen_string_literal: true

class ShelteredsController < ApplicationController
  def index
    @sheltereds = current_user.organization.sheltereds
  end

  def new
    @sheltered = Sheltered.new
  end

  def edit
    @sheltered = Sheltered.new
  end
end
