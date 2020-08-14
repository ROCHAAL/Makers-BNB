def wipe_test_database
  DatabaseConnection.setup("makersbnb_test")
  DatabaseConnection.query("TRUNCATE TABLE users RESTART IDENTITY CASCADE;")
end
