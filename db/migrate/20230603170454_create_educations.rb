class CreateEducations < ActiveRecord::Migration[7.0]
  def change
    create_table :educations do |t|
      t.string :location
      t.string :degree
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
