class CreateContactInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :contact_infos do |t|
      t.string :name
      t.string :phone
      t.references :address, foreign_key: true
      t.string :email
      t.references :entity, foreign_key: true

      t.timestamps
    end
  end
end
