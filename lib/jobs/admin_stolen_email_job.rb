class AdminStolenEmailJob
  @queue = "email"

  def self.perform(customer_contact_id)
    customer_contact = CustomerContact.find(customer_contact_id)
    CustomerMailer.admin_stolen_email(customer_contact).deliver
  end
end