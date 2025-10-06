class Like < ApplicationRecord
  belongs_to :user
  belongs_to :gossip,  optional: true
  belongs_to :comment, optional: true

  validate :one_target_only

  private
  def one_target_only
    if gossip_id.blank? && comment_id.blank?
      errors.add(:base, "Like must reference a gossip OR a comment")
    elsif gossip_id.present? && comment_id.present?
      errors.add(:base, "Like cannot reference both gossip AND comment")
    end
  end
end

