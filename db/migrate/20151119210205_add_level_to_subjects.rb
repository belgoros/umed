class AddLevelToSubjects < ActiveRecord::Migration
  def change
    add_column :subjects, :level_id, :integer
  end
end
