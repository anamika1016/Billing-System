class InvoiceMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.invoice_mailer.send_invoice.subject
  #
  def send_invoice(purchase)
    @purchase = purchase
    mail to: @purchase.customer_email, subject: "Your Invoice - #{@purchase.id}"
  end
end
