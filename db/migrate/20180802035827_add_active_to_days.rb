class AddActiveToDays < ActiveRecord::Migration[5.2]
  def change
    add_column :days, :active, :boolean, default: false
  end
end
