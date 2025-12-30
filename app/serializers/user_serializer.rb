class UserSerializer
    def initialize(user)
      @user = user
    end

    def as_json(*)
      {
        id: @user.id,
        name: @user.name,
        user_name: @user.user_name
      }
    end
end
