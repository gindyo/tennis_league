class CreateMatchParticipants < ActiveRecord::Migration
  def change
    create_table :match_participants do |t|
      t.integer :match_id, index: true
      t.integer :player_id, index: true
      t.string :type
      t.timestamps
    end
  end
end
