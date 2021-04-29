class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['USERNAME'], password: ENV['PASSWORD']

  def index
  end

  def show
    @productQuantity = Product.count
    @categoryQuantity = Category.count
  end
end
