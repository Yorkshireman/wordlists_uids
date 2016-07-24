class AddNotNullConstraintOnWordlistUuids < ActiveRecord::Migration
  def change
    change_column :wordlists, :uuid, :string, null: false
  end
end
