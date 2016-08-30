class CreateMappings < ActiveRecord::Migration[5.0]
  def change
    create_table :mappings do |t|
      t.string :name
      t.references :mapping_type, foreign_key: true
      t.text :description
      t.references :group, foreign_key: true
      t.text :received_text
      t.text :reply_text
      t.text :external_function
      t.text :hours_url
      t.text :location
      t.text :call_back_info

      t.timestamps
    end
  end
end
