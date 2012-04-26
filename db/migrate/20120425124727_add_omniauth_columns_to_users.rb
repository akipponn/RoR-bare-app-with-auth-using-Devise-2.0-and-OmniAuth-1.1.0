class AddOmniauthColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :uid, :string
    add_column :users, :provider, :string	# for omniauth: "facebook", "twitter" etc
    add_column :users, :screen_name, :string
  end
end
