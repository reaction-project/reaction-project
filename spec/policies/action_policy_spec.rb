require 'rails_helper'

RSpec.describe ActionPolicy do
  subject(:policy) { described_class }

  let(:admin) { build_stubbed(:user, :admin) }
  let(:user) { build_stubbed(:user) }
  let(:action) { build_stubbed(:action) }

  permissions :create? do
    it 'grants access to an admin user' do
      expect(policy).to permit(admin, action)
    end

    it 'denies access to non-admin users' do
      expect(policy).not_to permit(user, action)
    end
  end

  permissions :destroy? do
    it 'grants access to an admin user' do
      expect(policy).to permit(admin, action)
    end

    it 'denies access to non-admin users' do
      expect(policy).not_to permit(user, action)
    end
  end

  permissions :edit? do
    it 'grants access to an admin user' do
      expect(policy).to permit(admin, action)
    end

    it 'denies access to non-admin users' do
      expect(policy).not_to permit(user, action)
    end
  end

  permissions :index? do
    it 'grants access to a user' do
      expect(policy).to permit(user, action)
    end
  end

  permissions :new? do
    it 'grants access to an admin user' do
      expect(policy).to permit(admin, action)
    end

    it 'denies access to non-admin users' do
      expect(policy).not_to permit(user, action)
    end
  end

  permissions :show? do
    it 'grants access to a user' do
      expect(policy).to permit(user, action)
    end
  end

  permissions :update? do
    it 'grants access to an admin user' do
      expect(policy).to permit(admin, action)
    end

    it 'denies access to non-admin users' do
      expect(policy).not_to permit(user, action)
    end
  end
end
