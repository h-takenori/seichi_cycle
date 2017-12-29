class AddTokensToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :role, :string, default:"user"
    add_column :users, :name, :string
    add_column :users, :nickname, :string
    add_column :users, :oauth_token, :string
    add_column :users, :oauth_token_secret, :string
  end
end
