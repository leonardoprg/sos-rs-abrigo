# frozen_string_literal: true

class ShelteredPolicy < ApplicationPolicy
  def index?
    access?
  end

  def new?
    access?
  end

  def edit?
    access?
  end

  def update?
    access?
  end

  def create?
    access?
  end

  private

  def access?
    admin? || user.permissions.map(&:to_sym).include?(:sheltereds)
  end
end
