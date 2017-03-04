require 'rails_helper'

RSpec.describe UserCallbacks do
  let(:user) { create(:user) }

  describe '#after_create' do
    before do
      allow(user).to receive(:create_profile)
    end

    it 'creates a profile' do
      described_class.new.after_create(user)
      expect(user).to have_received(:create_profile)
    end
  end
end
