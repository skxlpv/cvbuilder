class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.date :deadline
      t.bigint :technologies_ids, array: true, default: [], null: true
      t.bigint :workers_ids, array: true, default: [], null: true

      t.timestamps
    end
  end
end
