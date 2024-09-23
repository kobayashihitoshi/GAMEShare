class AddGameTypeToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :game_type, :string
  end
end
