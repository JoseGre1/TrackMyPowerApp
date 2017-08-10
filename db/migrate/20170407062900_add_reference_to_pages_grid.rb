class AddReferenceToPagesGrid < ActiveRecord::Migration[5.0]
  def change
    add_reference(:pages, :grid, polymorphic: true, index: true)
  end
end
