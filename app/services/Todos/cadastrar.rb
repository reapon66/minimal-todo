module Todos
  class Cadastrar
    def self.call(user, tasks_params)
      new(user, tasks_params).call
    end

    def initialize(user, tasks_params)
      @user = user
      @tasks_params = tasks_params
    end

    def call
      task = user.tasks.new(tasks_params)
      task.save!
      task
    end

    private

    attr_reader :user, :tasks_params
  end
end
