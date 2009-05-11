class CreateCourts < ActiveRecord::Migration
  def self.up
    create_table :courts do |t|
      t.integer :number
      t.integer :district

      t.timestamps
    end
  end

  def self.down
    drop_table :courts
  end
end
