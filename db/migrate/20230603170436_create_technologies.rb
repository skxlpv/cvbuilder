class CreateTechnologies < ActiveRecord::Migration[7.0]
  def change
    create_table :technologies do |t|
      t.string :name
      t.text :description
      t.integer :tech_type

      t.timestamps
    end
  end
end
