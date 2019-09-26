# frozen_string_literal: true

class Post < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :title, :body, presence: :true
  validates_length_of :title, minimum: 3, maximum: 40
  validates_length_of :body, minimum: 5, maximum: 2000

end
