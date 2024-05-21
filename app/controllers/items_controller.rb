# frozen_string_literal: true

class ItemsController < ApplicationController
  def index
    @items = current_user.organization.items.order(:name)
  end

  def show
    @item = current_user.organization.items.find(params[:id])
  end

  def new
    @item = current_user.organization.items.new
  end

  def edit
    @item = current_user.organization.items.find(params[:id])
  end

  def create
    @item = current_user.organization.items.new(item_params)
    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end

  def search
    @items = current_user.organization.items.where('name LIKE ?', "%#{params[:search]}%")
    render :search, layout: false
  end

  def update
    @item = current_user.organization.items.find(params[:id])
    if @item.update(item_params)
      redirect_to items_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :quantity)
  end
end
