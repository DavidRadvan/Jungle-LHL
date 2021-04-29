class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['USERNAME'], password: ENV['PASSWORD'], except: :not_authorized

  def not_authorized
  end

  def index
  end

  def show
  end
end
