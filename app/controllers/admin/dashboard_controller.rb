module Admin
  class DashboardController < ApplicationController
    def index
      @products = Product.all
      @sales = Sale.all
    end
  end
end
