class AddUuidToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :uuid, :uuid, default: 'gen_random_uuid()', null: false
    rename_column :users, :id, :integer_id
    rename_column :users, :uuid, :id
    execute "ALTER TABLE images drop constraint fk_rails_19cd822056"
    execute "ALTER TABLE users drop constraint users_pkey;"
    execute "ALTER TABLE users ADD PRIMARY KEY (id);"
    execute "ALTER TABLE ONLY users ALTER COLUMN integer_id DROP DEFAULT;"
    change_column_null :users, :integer_id, true
    execute "DROP SEQUENCE IF EXISTS user_id_seq"
  end
end
