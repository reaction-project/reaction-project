class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles, id: :uuid do |t|
      t.string :first_name
      t.string :last_name
      t.text :avatar_data
      t.string :facebook
      t.string :medium
      t.string :twitter
      t.references :user, null: false, foreign_key: { on_delete: :restrict },
        index: true, type: :uuid

      t.timestamps
    end
  end
end
