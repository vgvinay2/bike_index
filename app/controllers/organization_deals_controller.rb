class OrganizationDealsController < ApplicationController

  def new
    @organization_deal = OrganizationDeal.new
    @organization = Organization.find(params[:organization_id])
    @name = params[:deal_name]
  end

  def create
    @organization_deal = OrganizationDeal.new(permitted_parameters)
    if @organization_deal.save
      flash[:notice] = "Thank you! We will contact the shop and register your bike on the Index!"
      redirect_to about_url
    else
      render action: :new
    end
  end

  private

  def permitted_parameters
    params.require(:organization_deal).permit(OrganizationDeal.old_attr_accessible)
  end
end