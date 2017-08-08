class AddReferenceToPagesNavbarTab < ActiveRecord::Migration[5.0]
  def change
    add_reference(:pages, :navbar_tab, polymorphic: true, index: true)
  end
end
