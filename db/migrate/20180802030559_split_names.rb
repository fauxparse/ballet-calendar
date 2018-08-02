class SplitNames < ActiveRecord::Migration[5.2]
  def up
    add_column :teachers, :first_name, :string
    add_column :teachers, :last_name, :string
    remove_column :teachers, :name
  end

  def down
    add_column :teachers, :name, :string
    remove_column :teachers, :first_name
    remove_column :teachers, :last_name
  end
end
