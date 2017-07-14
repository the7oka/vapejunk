class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
    	t.references :user
    	t.string :name
    	t.integer :amount
    	t.integer :nic_strength
    	t.integer :nic_vg
    	t.integer :target_nic
    	t.integer :target_vg
      t.timestamps
    end
  end
end
