class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.references :home_court, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
