module Admin
  class DashboardController < ApplicationController
    before_action :authenticate_user!
    before_action :authorize_admin!

    def index
      # Aquí puedes agregar la lógica para la vista del dashboard
    end

    private

    def authorize_admin!
      redirect_to root_path, alert: "No tienes permiso para acceder a esta página." unless current_user.role == "admin"
    end
  end
end
