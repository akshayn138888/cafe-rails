class AddUserToDailyMenus < ActiveRecord::Migration[6.0]
  def change
    add_reference :daily_menus, :user, null: false, foreign_key: true
  end
end
