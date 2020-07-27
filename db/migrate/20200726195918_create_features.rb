class CreateFeatures < ActiveRecord::Migration[6.0]
  def change
    create_table :features do |t|
      t.references :daily_menu, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true
      t.float :price
      t.boolean :portion
      t.timestamps
    end
  end
end
