class CreateHomeCourts < ActiveRecord::Migration
  def change
    create_table :home_courts do |t|
      t.references :location
      t.string :name

      t.timestamps
    end
  end
end
