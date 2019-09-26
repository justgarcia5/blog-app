# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { build(:user) }
  describe 'post' do
    context 'when all attributes supplied' do
      let(:post) { build(:post) }
      it 'post' do
        expect(post).to be_valid
      end
    end
    context 'when attributes are missing' do
      let(:post) { build(:post, title: nil, body: nil) }
      it 'cannot be created without title & body' do
        # byebug
        expect(post).to_not be_valid
      end
    end
  end
end
