class CreatePhoneNumbers < ActiveRecord::Migration[5.0]
  def change
    create_table :phone_numbers do |t|
      t.string :name
      t.string :number
      t.references :group, foreign_key: true
      t.text :description
      t.text :our_metadata
      t.text :their_metadata

      t.timestamps
    end
  end
end
