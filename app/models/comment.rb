class Comment < ApplicationRecord
	belongs_to :link
	belongs_to :user
	has_many :comment_of_comments
end
