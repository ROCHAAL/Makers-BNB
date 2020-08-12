def wipe_test_database
  DatabaseConnection.setup("makersbnb_test")
  DatabaseConnection.query("TRUNCATE listings RESTART IDENTITY;
                            TRUNCATE users RESTART IDENTITY;")
end