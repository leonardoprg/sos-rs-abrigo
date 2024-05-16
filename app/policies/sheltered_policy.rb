# frozen_string_literal: true

class ShelteredPolicy < ApplicationPolicy
  def index?
    admin? || user.permissions.map(&:to_sym).include?(:sheltereds_list)
  end

  def new?
    admin? || user.permissions.map(&:to_sym).include?(:sheltereds_create)
  end

  def edit?
    admin? || user.permissions.map(&:to_sym).include?(:sheltereds_update)
  end

  def update?
    admin? || user.permissions.map(&:to_sym).include?(:sheltereds_update)
  end

  def create?
    admin? || user.permissions.map(&:to_sym).include?(:sheltereds_create)
  end

  def show?
    admin? || user.permissions.map(&:to_sym).include?(:sheltereds_show)
  end
end
