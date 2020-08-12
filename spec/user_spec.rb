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

    it 'encrypts a password with BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('test123')

      User.create(username: 'testuser', password: 'test123', email: 'test@testface.com')
    end
  end 

  describe '.find' do 
    it 'finds a user given their id' do
      user = User.create(username: 'testuser', password: 'test123', email: 'test@testface.com')
      result = User.find(user.id)

      expect(result).to be_a User
      expect(result.email).to eq 'test@testface.com'
      expect(result.username).to eq 'testuser'
    end
  end

  describe '.authenticate' do
    it 'will return matching user based on username and password' do
      user = User.create(username: 'testuser', password: 'test123', email: 'test@testface.com')

      check = User.authenticate(username: 'testuser', password: 'test123')

      expect(check.id).to eq user.id
    end

    it 'will return nil if username and password do not match' do
      user = User.create(username: 'testuser', password: 'test123', email: 'test@testface.com')

      check = User.authenticate(username: 'testuserr', password: 'test1234')

      expect(check).to eq nil
    end

    it 'will return nil if username matches but password does not' do
      user = User.create(username: 'testuser', password: 'test123', email: 'test@testface.com')

      check = User.authenticate(username: 'testuser', password: 'test1234')

      expect(check).to eq nil
    end
  end
end
