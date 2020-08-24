class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,               null: false
      t.string :url,                null: false
      t.string :code,               null: false
      t.text :description,          null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
