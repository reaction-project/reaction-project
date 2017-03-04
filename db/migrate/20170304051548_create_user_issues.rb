class CreateUserIssues < ActiveRecord::Migration[5.0]
  def change
    create_table :user_issues, id: :uuid do |t|
      t.references :user, null: false, foreign_key: { on_delete: :cascade },
        index: true, type: :uuid

      t.references :issue, null: false, foreign_key: { on_delete: :cascade },
        index: true, type: :uuid

      t.timestamps
    end
  end
end
