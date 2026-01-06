class UserSerializer
    def initialize(user)
      @user = user
    end

    def as_json(*)
      {
        name: @user.name,
        user_name: @user.user_name
      }
    end
end
