class AddUsernameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :username, :string, unique: true

    User.all.each { |user| user.update! username: user.email }
    change_column_null :users, :username, false

    add_index :users, :username, unique: true
  end
end
