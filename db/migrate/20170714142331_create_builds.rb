class CreateBuilds < ActiveRecord::Migration[5.1]
  def change
    create_table :builds do |t|
    	t.references :user
    	t.string :name
    	t.string :tank
    	t.string :wire
    	t.string :cotton
    	t.attachment :avatar
      t.timestamps
    end
  end
end
