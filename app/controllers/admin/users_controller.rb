# app/controllers/admin/users_controller.rb
class Admin::UsersController < Admin::BaseController
    def index
      @users = User.all
    end
  
    # Define otras acciones CRUD
  end
  