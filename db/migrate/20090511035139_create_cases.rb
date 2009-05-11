class CreateCases < ActiveRecord::Migration
  def self.up
    create_table :cases do |t|
      t.string :number
      t.integer :court
      t.integer :district
      t.string :url
      t.date :filing_date
      t.datetime :last_checked

      t.timestamps
    end
  end

  def self.down
    drop_table :cases
  end
end
