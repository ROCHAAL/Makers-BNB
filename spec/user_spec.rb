require 'user'
describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(username: 'testuser', password: 'test123', email: 'test@testface.com')
      
      persisted_data = DatabaseConnection.query("SELECT * FROM users WHERE id = '#{user.id}';")
      
      expect(user).to be_a User
      expect(user.id).to eq persisted_data.first['id']
      expect(user.email).to eq 'test@testface.com'
      expect(user.username).to eq 'testuser'
    end
  end 
end
