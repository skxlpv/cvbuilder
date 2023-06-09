class CreateJoinTableWorkersTechnologies < ActiveRecord::Migration[7.0]
  def change
    create_join_table :workers, :technologies do |t|
      t.index [:worker_id, :technology_id]
      t.index [:technology_id, :worker_id]
    end
  end
end
