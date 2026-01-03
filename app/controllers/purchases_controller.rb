class PurchasesController < ApplicationController
  def index
    @purchases = Purchase.all.order(created_at: :desc)
  end

  def show
    @purchase = Purchase.find(params[:id])
  end
end
