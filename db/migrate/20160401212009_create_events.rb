class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text   :description
      t.string :course
      t.datetime :start_time
      t.datetime :end_time
      #t.references :user, index: true, foreign_key: true
      t.timestamps null: false
    end
    #add_index :events, [:user_id, :start_time, :end_time]
  end
end
