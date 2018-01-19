class CreateEntities < ActiveRecord::Migration[5.0]
  def change
    create_table :entities do |t|
      t.string :name
      t.references :contact_info, foreign_key: true
      t.references :address, foreign_key: true
      t.string :uuid
      t.string :stripe_id

      t.timestamps
    end
  end
end
