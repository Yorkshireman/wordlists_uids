class CreateWordlistsWithoutIds < ActiveRecord::Migration
  def change
    create_table :wordlists, id: false do |t|
      t.string :uuid, limit: 36, primary: true
      t.string :title

      t.timestamps null: false
    end
  end
end
