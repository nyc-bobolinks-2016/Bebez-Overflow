class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :voteable_id, null: false
      t.integer :voter_id, null: false
      t.string  :voteable_type, null: false
      t.integer :vote_value, null: false
      t.timestamps(null: false)
    end
  end
end
