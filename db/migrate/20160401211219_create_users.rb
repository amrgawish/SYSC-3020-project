class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.boolean  "admin",      default: false
      t.string   "password_digest"
      t.string   "remember_digest"
      t.boolean  "activated",  default: true
      t.string :course
      t.timestamps null: false
    end
 
   add_index :users, [:email]
  end
end
