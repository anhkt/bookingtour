class Comment < ApplicationRecord
  has_closure_tree

  belongs_to :user
  belongs_to :review

  has_many :likes
end
