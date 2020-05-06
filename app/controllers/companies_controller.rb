class CompaniesController < ApplicationController
  before_action :find_company, only: %i(update destroy)

  def index
    @companies = Company.search params[:q]
    if @companies.size == 0
      @companies = Company.all.order(id: :desc).page(params[:page]).per(25)
    end
  end
  def crawl_data
    Company.crawl_data
    redirect_to root_path and return
  end
  def edit
  end
  def update
  end
  def destroy
    @company.destroy
    redirect_to root_path and return
  end

  private

  def find_company
    @company = Company.find_by(id:params[:id])
  end
end
