class CreateMoments < ActiveRecord::Migration[6.0]
  def change
    create_table :moments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :tribe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
