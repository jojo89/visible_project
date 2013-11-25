class CreateStartups < ActiveRecord::Migration
  def change
    create_table :startups do |t|
      t.string :website
      t.string :name
      t.string :logo_url
      t.integer :logo
      t.string :state
      t.string :city
      t.text :description
      t.text :pitch
      t.text :markets
      t.string :angel_url	
      t.timestamps
    end
  end
end
