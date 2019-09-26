# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :body, presence: :true
  validates_length_of :body, minimum: 5, maximum: 1000


  validate :comment_limit, on: :create

  scope :today, -> { where(created_at: (Time.now.beginning_of_day..Time.now.end_of_day)) }

  private

  def comment_limit
    if user.comments.today.count >= 2
      errors.add(:base, 'You can only comment on two blogs per day')
    end
  end
end
