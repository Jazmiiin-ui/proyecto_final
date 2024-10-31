# app/controllers/admin/base_controller.rb
class Admin::BaseController < ApplicationController
    before_action :authenticate_user!
    before_action :admin_only
  
    private
  
    def admin_only
      # Redirige a la página principal con un mensaje de error si el usuario no es administrador
      redirect_to root_path, alert: "Acceso denegado" unless current_user&.role == "admin"
    end
  end
  