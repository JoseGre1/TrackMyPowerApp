class CreateNavbarMainTabs < ActiveRecord::Migration[5.0]
  def change
    create_table :navbar_main_tabs do |t|
      t.string :title
      t.string :icon

      t.timestamps
    end
  end
end
