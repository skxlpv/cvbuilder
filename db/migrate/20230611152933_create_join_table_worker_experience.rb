class CreateJoinTableWorkerExperience < ActiveRecord::Migration[7.0]
  def change
    create_join_table :workers, :experiences do |t|
      t.index [:worker_id, :experience_id]
      t.index [:experience_id, :worker_id]
    end
  end
end
