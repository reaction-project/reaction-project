require 'rails_helper'

RSpec.describe FeaturePolicy do
  subject(:policy) { described_class }

  let(:admin) { build_stubbed(:user, :admin) }
  let(:user) { build_stubbed(:user) }
  let(:feature) { build_stubbed(:feature) }

  permissions :create? do
    it 'grants access to an admin user' do
      expect(policy).to permit(admin, feature)
    end

    it 'denies access to non-admin users' do
      expect(policy).not_to permit(user, feature)
    end
  end

  permissions :destroy? do
    it 'grants access to an admin user' do
      expect(policy).to permit(admin, feature)
    end

    it 'denies access to non-admin users' do
      expect(policy).not_to permit(user, feature)
    end
  end

  permissions :edit? do
    it 'grants access to an admin user' do
      expect(policy).to permit(admin, feature)
    end

    it 'denies access to non-admin users' do
      expect(policy).not_to permit(user, feature)
    end
  end

  permissions :index? do
    it 'grants access to a user' do
      expect(policy).to permit(user, feature)
    end
  end

  permissions :new? do
    it 'grants access to an admin user' do
      expect(policy).to permit(admin, feature)
    end

    it 'denies access to non-admin users' do
      expect(policy).not_to permit(user, feature)
    end
  end

  permissions :show? do
    it 'grants access to a user' do
      expect(policy).to permit(user, feature)
    end
  end

  permissions :update? do
    it 'grants access to an admin user' do
      expect(policy).to permit(admin, feature)
    end

    it 'denies access to non-admin users' do
      expect(policy).not_to permit(user, feature)
    end
  end
end
