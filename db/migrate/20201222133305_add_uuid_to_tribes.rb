class AddUuidToTribes < ActiveRecord::Migration[6.0]
  def change
    add_column :tribes, :uuid, :string
    add_index :tribes, :uuid, unique: true
  end
end
