class AddIndexToWordlistsUuid < ActiveRecord::Migration
  def change
    add_index :wordlists, :uuid, unique: true
  end
end
