class CreateMatchRequests < ActiveRecord::Migration
  def change
    create_table :match_requests do |t|
      t.integer :from
      t.integer :to
      t.references :match, :index => true 
      t.timestamps
    end
  end
end
