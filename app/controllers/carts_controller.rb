class CartsController < ApplicationController
    before_action :authenticate_user!
  
    def show
      @cart = session[:cart] || {}
    end
  
    def add
      product = Product.find(params[:product_id])
      session[:cart] ||= {}
      
      session[:cart][product.id.to_s] ||= 0
      session[:cart][product.id.to_s] += 1
      
      redirect_to cart_path, notice: "#{product.title} ha sido añadido al carrito."
    end
  
    def remove
      session[:cart].delete(params[:product_id])
      redirect_to cart_path, notice: "Producto eliminado del carrito."
    end
  
    def checkout
      @order = Order.new(user: current_user)
  
      # Crear OrderItems para cada producto en el carrito
      session[:cart].each do |product_id, quantity|
        product = Product.find(product_id)
        @order.order_items.build(product: product, quantity: quantity)
      end
  
      if @order.save
        session[:cart] = {}  # Vaciar el carrito después de la compra
        redirect_to orders_path, notice: "Tu pedido ha sido realizado con éxito."
      else
        render :show  # Renderizar la vista del carrito si hay un error
      end
    end
  end
  