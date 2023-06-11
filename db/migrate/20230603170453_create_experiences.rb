class CreateExperiences < ActiveRecord::Migration[7.0]
  def change
    create_table :experiences do |t|
      t.string :title
      t.string :project_description
      t.date :start_date
      t.date :end_date
      t.boolean :commercial

      t.timestamps
    end
  end
end
