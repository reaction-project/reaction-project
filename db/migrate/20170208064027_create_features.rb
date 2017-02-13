class CreateFeatures < ActiveRecord::Migration[5.0]
  def change
    create_table :features do |t|
      t.integer :position, null: false, default: 0
      t.references :action, null: false, foreign_key: true

      t.timestamps
    end
  end
end
