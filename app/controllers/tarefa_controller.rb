class TarefaController < ApplicationController
  def create
    task = Todos::Cadastrar.call(current_user, tasks_params)

    render json: task.as_json, status: :created
  end

  private

  def tasks_params
    params.require(:task).permit(:title, :content, :status)
  end
end
