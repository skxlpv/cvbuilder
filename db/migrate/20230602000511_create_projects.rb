class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.date :deadline
      t.references :technologies, null: true, foreign_key: true
      t.references :workers, null: true, foreign_key: true

      t.timestamps
    end
  end
end
