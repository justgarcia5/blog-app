# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :body, presence: :true

  validate :comment_limit, on: :create

  scope :today, -> { where(created_at: (Time.now.beginning_of_day..Time.now.end_of_day)) }

  # scope :user_email, -> { where(user_id: user.id)} }

  private

  def comment_limit
    if user.comments.today.count >= 2
      errors.add(:base, 'You can only comment on two blogs per day')
    end
  end
end
