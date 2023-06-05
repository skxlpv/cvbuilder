class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :first_name
      t.string :surname
      t.string :age
      t.string :password_digest
      t.string :remember_token
      t.string :remember_token_expires_at
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end
