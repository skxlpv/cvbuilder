class CreateJoinTableWorkersLanguages < ActiveRecord::Migration[7.0]
  def change
    create_join_table :workers, :languages do |t|
      t.index [:worker_id, :language_id]
      t.index [:language_id, :worker_id]
    end
  end
end
