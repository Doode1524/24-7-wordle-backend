class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.integer :current_streak
      t.integer :best_streak
      t.integer :wins
      t.integer :losses
      
      t.timestamps
    end
  end
end
