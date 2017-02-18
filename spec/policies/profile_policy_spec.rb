require 'rails_helper'

RSpec.describe ProfilePolicy do
  subject(:policy) { described_class }

  let(:user) { build_stubbed(:user) }
  let(:profile) { build_stubbed(:profile, user: user) }

  permissions :create? do
    it 'denies access' do
      expect(policy).not_to permit(user, profile)
    end
  end

  permissions :destroy? do
    it 'denies access' do
      expect(policy).not_to permit(user, profile)
    end
  end

  permissions :edit? do
    it 'grants access to the profile owner' do
      expect(policy).to permit(user, profile)
    end

    it 'denies access to non-owner users' do
      user = build_stubbed(:user)
      expect(policy).not_to permit(user, profile)
    end
  end

  permissions :index? do
    it 'grants access' do
      expect(policy).to permit(user, profile)
    end
  end

  permissions :new? do
    it 'denies access' do
      expect(policy).not_to permit(user, profile)
    end
  end

  permissions :show? do
    it 'grants access' do
      expect(policy).to permit(user, profile)
    end
  end

  permissions :update? do
    it 'grants access to the profile owner' do
      expect(policy).to permit(user, profile)
    end

    it 'denies access to non-owner users' do
      user = build_stubbed(:user)
      expect(policy).not_to permit(user, profile)
    end
  end
end
