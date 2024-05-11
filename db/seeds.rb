ActiveRecord::Base.transaction do
  organization = Organization.create!(name: 'Ulbra')

  organization.users.create!(name: 'Admin', email: 'admin@ulbra.com', password: '123456', password_confirmation: '123456', role: 'admin')
end