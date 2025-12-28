class UsersController < ApplicationController
  def listar_all

    @usuarios = Users::ListarTodos.call
    render json: @usuarios
  end
end
