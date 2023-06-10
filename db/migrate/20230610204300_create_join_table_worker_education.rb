class CreateJoinTableWorkerEducation < ActiveRecord::Migration[7.0]
  def change
    create_join_table :workers, :educations do |t|
      t.index [:worker_id, :education_id]
      t.index [:education_id, :worker_id]
    end
  end
end
