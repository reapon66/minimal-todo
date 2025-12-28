module Users
  class ListarTodos
    def self.call
      User.all
    end
  end
end
