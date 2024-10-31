module Admin
    class ProductsController < ApplicationController
      before_action :authenticate_user!
      before_action :authorize_admin!
      before_action :set_product, only: [:edit, :update, :destroy]
  
      def index
        @products = Product.all
      end
  
      def new
        @product = Product.new
      end
  
      def create
        @product = Product.new(product_params)
        if @product.save
          redirect_to admin_dashboard_path, notice: 'Producto creado exitosamente.'
        else
          render :new
        end
      end
  
      def edit
      end
  
      def update
        if @product.update(product_params)
          redirect_to admin_dashboard_path, notice: 'Producto actualizado exitosamente.'
        else
          render :edit
        end
      end
  
      def destroy
        @product.destroy
        redirect_to admin_dashboard_path, notice: 'Producto eliminado exitosamente.'
      end
  
      private
  
      def set_product
        @product = Product.find(params[:id])
      end
  
      def product_params
        params.require(:product).permit(:title, :description, :price, :image)
      end
  
      def authorize_admin!
        redirect_to root_path, alert: "No tienes permiso para acceder a esta página." unless current_user.role == "admin"
      end
    end
  end
  