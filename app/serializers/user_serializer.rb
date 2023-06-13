class UserSerializer 
  def self.creation(user)
    {
      data: {
        id: "#{user.id}",
        type: "users",
        attributes: {
          email: "#{user.email}",
          api_key: "#{user.api_key}"
        }
      }
    }
  end
end