class AddFavoriteCityToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :favorite_city, :string
  end
end
