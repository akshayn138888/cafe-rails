class CreateDailyMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :daily_menus do |t|
      t.datetime :date

      t.timestamps
    end
  end
end
