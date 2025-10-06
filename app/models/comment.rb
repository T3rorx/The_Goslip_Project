class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :gossip

  # <<== Fix: éviter la constante "ParentComment"
  belongs_to :parent_comment, class_name: 'Comment', optional: true
  has_many :replies, class_name: 'Comment', foreign_key: :parent_comment_id, dependent: :destroy
end
