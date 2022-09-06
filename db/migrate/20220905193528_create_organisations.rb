class CreateOrganisations < ActiveRecord::Migration[7.0]
  def change
    create_table :organisations do |t|
      t.string :name, null: false
      t.integer :code
      t.string :website
      t.string :email
      t.datetime :established_at
      t.boolean :is_active
      t.timestamps
    end
    add_index :organisations, :id
    add_reference :industries, :industry, foreign_key: true
    add_reference :regions, :region, foreign_key: true
    add_reference :items, :item, foreign_key: true
  end
end
