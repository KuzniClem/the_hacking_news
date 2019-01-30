class CreateCommentOfComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comment_of_comments do |t|
    	t.belongs_to :user
    	t.belongs_to :comment
      t.text :content

      t.timestamps
    end
  end
end
