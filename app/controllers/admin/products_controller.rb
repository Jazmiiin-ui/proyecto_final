# app/controllers/admin/products_controller.rb
class Admin::ProductsController < Admin::BaseController
    def index
      @products = Product.all
    end
  
    def new
      @product = Product.new
    end
  
    # Define otras acciones CRUD
  end
  