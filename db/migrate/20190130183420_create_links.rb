class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
    	t.belongs_to :user
      t.string :url

      t.timestamps
    end
  end
end
