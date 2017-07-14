class CreateFlavors < ActiveRecord::Migration[5.1]
  def change
    create_table :flavors do |t|
    	t.references :recipe
    	t.string :name
    	t.integer :percentage 
    	t.boolean :vg
      t.timestamps
    end
  end
end
