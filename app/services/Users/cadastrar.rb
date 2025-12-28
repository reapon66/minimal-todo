module Users
  class Cadastrar
    def self.call(user_params)
      User.create!(user_params)
    end
  end
end
