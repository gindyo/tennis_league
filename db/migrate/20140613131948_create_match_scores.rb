class CreateMatchScores < ActiveRecord::Migration
  def change
    create_table :match_scores do |t|
      t.integer :set1
      t.integer :set2
      t.integer :set3
      t.integer :set4
      t.integer :set5
      t.belongs_to :match_participant
      t.timestamps
    end
  end
end
