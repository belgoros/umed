class AddLevelToSubjects < ActiveRecord::Migration[5.2]
  def change
    add_column :subjects, :level_id, :integer
  end
end
