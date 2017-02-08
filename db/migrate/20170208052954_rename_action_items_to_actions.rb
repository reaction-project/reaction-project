class RenameActionItemsToActions < ActiveRecord::Migration[5.0]
  def change
    rename_table :action_items, :actions
  end
end
