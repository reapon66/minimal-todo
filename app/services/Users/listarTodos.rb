module Users
  class ListarTodos
    def self.call
      User.all.as_json(except: [ :senha, :id ])
    end
  end
end
