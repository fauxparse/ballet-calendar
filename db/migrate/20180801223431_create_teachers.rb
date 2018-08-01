class CreateTeachers < ActiveRecord::Migration[5.2]
  def change
    enable_extension :citext

    create_table :teachers do |t|
      t.string :name
      t.citext :email
      t.string :uid
      t.string :avatar

      t.index :uid
    end
  end
end
