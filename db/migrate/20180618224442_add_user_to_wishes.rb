class AddUserToWishes < ActiveRecord::Migration[5.1]
  def change
    add_reference :wishes, :user, foreign_key: true
  end
end
