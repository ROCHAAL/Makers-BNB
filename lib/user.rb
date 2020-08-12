require_relative 'database_connection'

class User
  attr_reader :id, :username, :email

  def initialize(id:, username:, email:)
    @id = id
    @email = email
    @username = username
  end

  def self.create(username:, password:, email:)
    result = DatabaseConnection.query("INSERT INTO users (username, password, email) 
      VALUES('#{username}', '#{password}', '#{email}') 
      RETURNING id, username, email;")
      
    User.new(id: result[0]['id'], 
      username: result[0]['username'],
      email: result[0]['email']
    )
  end
end
