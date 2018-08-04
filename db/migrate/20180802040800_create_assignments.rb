class CreateAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :assignments do |t|
      t.belongs_to :day, foreign_key: { on_delete: :cascade }
      t.belongs_to :teacher, foreign_key: { on_delete: :cascade }
      t.integer :position

      t.index %i[day_id teacher_id], unique: true
    end
  end
end
