class AddCheckoutInfoToUser < ActiveRecord::Migration
  def change
    add_column :users, :full_name, :string
    add_column :users, :phone_number, :string
    add_column :users, :street, :string
    add_column :users, :city, :string
    add_column :users, :zip_code, :string
    add_column :users, :cardholder, :string
    add_column :users, :card_number, :string
    add_column :users, :expiration_date, :string
    add_column :users, :cvc, :string
  end
end
