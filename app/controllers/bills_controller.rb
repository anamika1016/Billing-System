class BillsController < ApplicationController
  def new
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(customer_email: params[:customer_email], paid_amount: params[:paid_amount])

    total_without_tax = 0
    total_tax = 0

    items_params = params[:items] || []
    if items_params.respond_to?(:values)
      items_params = items_params.values
    end

    ActiveRecord::Base.transaction do
      items_params.each do |item_data|
        prod_id = item_data["product_id"]
        qty = item_data["quantity"].to_i

        next if prod_id.blank? || qty <= 0

        product = Product.find_by(product_id: prod_id)
        next unless product

        unit_price = product.price
        tax_pct = product.tax_percentage

        purchase_price = unit_price * qty
        tax_payable = purchase_price * (tax_pct / 100)
        total_price = purchase_price + tax_payable

        @purchase.purchase_items.build(
          product: product,
          quantity: qty,
          unit_price: unit_price,
          tax_percentage: tax_pct,
          purchase_price: purchase_price,
          tax_payable: tax_payable,
          total_price: total_price
        )

        total_without_tax += purchase_price
        total_tax += tax_payable

        # Update stock
        product.update!(stock: product.stock - qty)
      end

      @purchase.total_without_tax = total_without_tax
      @purchase.total_tax = total_tax
      @purchase.net_price = total_without_tax + total_tax
      @purchase.rounded_net_price = @purchase.net_price.to_i
      @purchase.balance_payable = @purchase.paid_amount - @purchase.rounded_net_price

      # Process denominations into a hash: { "500" => 2, "50" => 1, ... }
      denoms_data = params[:denominations] || {}
      collected = {}
      if denoms_data.respond_to?(:values)
        denoms_data.values.each do |d|
          val = d["value"].to_s
          count = d["count"].to_i
          collected[val] = count if count > 0
        end
      end
      @purchase.denominations_collected = collected

      if @purchase.save
        # Send invoice asynchronously
        InvoiceMailer.send_invoice(@purchase).deliver_later
        redirect_to bill_path(@purchase)
      else
        render :new
      end
    end
  rescue ActiveRecord::RecordInvalid => e
    flash[:error] = e.message
    render :new
end

  def show
    @purchase = Purchase.find(params[:id])
  end
end
