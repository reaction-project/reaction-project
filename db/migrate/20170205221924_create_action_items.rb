class CreateActionItems < ActiveRecord::Migration[5.0]
  def change
    create_table :action_items do |t|
      t.references :issue, null: false, foreign_key: { on_delete: :restrict }
      t.references :category, null: false, foreign_key: { on_delete: :restrict }
      t.string :eyebrow
      t.string :title, null: false
      t.text :summary
      t.text :body
      t.string :time_commitment
      t.integer :priority, null: false, default: 0
      t.boolean :event, null: false, default: false
      t.string :location
      t.datetime :happening_at
      t.text :image_data

      t.timestamps
    end
  end
end
