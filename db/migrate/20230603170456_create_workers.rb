class CreateWorkers < ActiveRecord::Migration[7.0]
  def change
    create_table :workers do |t|
      t.references :user, null: false, foreign_key: true
      t.references :technologies, null: true, foreign_key: true
      t.references :languages, null: true, foreign_key: true
      t.references :educations, null: true, foreign_key: true

      t.string :phone_number
      t.string :summary
      # :work_experience
      t.text :skills

      t.timestamps
    end
  end
end
