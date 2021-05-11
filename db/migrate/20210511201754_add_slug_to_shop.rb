class AddSlugToShop < ActiveRecord::Migration[6.0]
  def change
    add_column :shops, :slug, :string
  end
end
