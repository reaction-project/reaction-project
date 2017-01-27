class CreateIssues < ActiveRecord::Migration[5.0]
  def change
    create_table :issues do |t|
      t.string :name, null: false
      t.text :lead
      t.text :body
      t.text :icon_data

      t.timestamps null: false
    end
  end
end
