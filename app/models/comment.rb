class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  has_many :replies, as: :commentable, class_name: 'Comment', dependent: :destroy
  belongs_to :user
  has_many :like_comments
end
