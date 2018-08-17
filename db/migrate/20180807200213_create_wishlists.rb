class CreateWishlists < ActiveRecord::Migration[5.1]
  def change
    create_table :wishlists do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
