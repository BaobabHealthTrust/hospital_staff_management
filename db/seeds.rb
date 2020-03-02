ActiveRecord::Base.transaction do
    ActiveRecord::Base.connection.execute <<~SQL
      set foreign_key_checks=0
    SQL
    role = Role.create!(role_name: 'admin', description: 'superuser')
    user = User.create!(first_name: 'Super', last_name: 'User', username: 'admin', password: 'test', password_confirmation: 'test', email: 'admin@mail.com', date_of_birth: '2019-02-26', role_id: 1)
end