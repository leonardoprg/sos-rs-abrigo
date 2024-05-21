# frozen_string_literal: true

class ItemPolicy < ApplicationPolicy
  def index?
    admin? || user.permissions.map(&:to_sym).include?(:items_list)
  end

  def new?
    admin? || user.permissions.map(&:to_sym).include?(:items_create)
  end

  def edit?
    admin? || user.permissions.map(&:to_sym).include?(:items_update)
  end

  def update?
    admin? || user.permissions.map(&:to_sym).include?(:items_update)
  end

  def create?
    admin? || user.permissions.map(&:to_sym).include?(:items_create)
  end

  def show?
    admin? || user.permissions.map(&:to_sym).include?(:items_show)
  end
end
