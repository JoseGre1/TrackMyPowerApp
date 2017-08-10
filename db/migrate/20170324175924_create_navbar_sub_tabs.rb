class CreateNavbarSubTabs < ActiveRecord::Migration[5.0]
  def change
    create_table :navbar_sub_tabs do |t|
      t.string :title
      t.references :navbar_main_tab, foreign_key: true

      t.timestamps
    end
  end
end
