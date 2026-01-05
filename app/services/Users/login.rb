module Users
  class Login
    def self.call(user_params)
      new(
        user_name: user_params[:user_name],
        password: user_params[:password]
      ).call
    end

    def initialize(user_name:, password:)
      @user_name = user_name
      @password = password
    end

    def call
      user = User.find_by(user_name: user_name)
      return nil unless user
      return nil unless user.authenticate(password)

      user
    end

    private

    attr_reader :user_name, :password
  end
end
