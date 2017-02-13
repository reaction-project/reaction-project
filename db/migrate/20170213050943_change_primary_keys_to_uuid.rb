require 'webdack/uuid_migration/helpers'

class ChangePrimaryKeysToUuid < ActiveRecord::Migration[5.0]
  def change
    reversible do |dir|
      dir.up do
        primary_key_and_all_references_to_uuid :actions
        primary_key_and_all_references_to_uuid :categories
        primary_key_and_all_references_to_uuid :issues

        primary_key_to_uuid :features
        primary_key_to_uuid :users
      end

      dir.down do
        raise ActiveRecord::IrreversibleMigration
      end
    end
  end
end
