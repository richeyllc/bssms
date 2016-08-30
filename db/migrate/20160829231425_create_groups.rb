class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :uuid
      t.string :stripe_token

      t.timestamps
    end
  end
end
