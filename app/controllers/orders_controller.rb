class OrdersController < ApplicationController
    before_action :authenticate_user! # Asegúrate de que el usuario esté autenticado
  
    def index
      @orders = current_user.orders
    end
  
    def show
      @order = current_user.orders.find(params[:id])
    end
  end
  