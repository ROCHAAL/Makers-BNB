require_relative 'database_connection'
require 'bcrypt'

class User
  attr_reader :id, :username, :email

  def initialize(id:, username:, email:)
    @id = id
    @email = email
    @username = username
  end

  def self.create(username:, password:, email:)
    encrypted_password = BCrypt::Password.create(password)
   
    result = DatabaseConnection.query("INSERT INTO users (username, password, email) 
      VALUES('#{username}', '#{encrypted_password}', '#{email}') 
      RETURNING id, username, email;")
      
    User.new(id: result[0]['id'], 
      username: result[0]['username'],
      email: result[0]['email']
    )
  end

  def self.find(id)
    result = DatabaseConnection.query("SELECT * FROM users WHERE id='#{id}';")

    User.new(id: result[0]['id'],
      username: result[0]['username'],
      email: result[0]['email']
    )
  end

  def self.authenticate(username:, password:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE username='#{username}';")

    User.new(id: result[0]['id'],
      username: result[0]['username'],
      email: result[0]['email']
      )
  end
end
