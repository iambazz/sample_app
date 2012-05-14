class AddCountryAgeToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :country, :string
    add_column :users, :age, :integer
  end

  def self.down
    remove_column :users, :country
    remove_column users: :age
  end
end
