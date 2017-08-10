class RemoveReferenceFromPagesGrid < ActiveRecord::Migration[5.0]
  def change
    remove_reference(:pages, :grid, polymorphic: true, index: true)
  end
end
