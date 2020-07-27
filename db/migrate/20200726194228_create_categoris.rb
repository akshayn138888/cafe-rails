class CreateCategoris < ActiveRecord::Migration[6.0]
  def change
    create_table :categoris do |t|
      t.string :name

      t.timestamps
    end
  end
end
