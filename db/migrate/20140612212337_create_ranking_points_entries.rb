class CreateRankingPointsEntries < ActiveRecord::Migration
  def change
    create_table :ranking_points_entries do |t|
      t.date :expire_on
      t.decimal :points
      t.references :player, index: true

      t.timestamps
    end
  end
end
