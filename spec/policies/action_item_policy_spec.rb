require 'rails_helper'

RSpec.describe ActionItemPolicy do
  subject(:policy) { described_class }

  let(:admin) { build_stubbed(:user, :admin) }
  let(:user) { build_stubbed(:user) }
  let(:action_item) { build_stubbed(:action_item) }

  permissions :create? do
    it 'grants access to an admin user' do
      expect(policy).to permit(admin, action_item)
    end

    it 'denies access to non-admin users' do
      expect(policy).not_to permit(user, action_item)
    end
  end

  permissions :destroy? do
    it 'grants access to an admin user' do
      expect(policy).to permit(admin, action_item)
    end

    it 'denies access to non-admin users' do
      expect(policy).not_to permit(user, action_item)
    end
  end

  permissions :edit? do
    it 'grants access to an admin user' do
      expect(policy).to permit(admin, action_item)
    end

    it 'denies access to non-admin users' do
      expect(policy).not_to permit(user, action_item)
    end
  end

  permissions :index? do
    it 'grants access to a user' do
      expect(policy).to permit(user, action_item)
    end
  end

  permissions :new? do
    it 'grants access to an admin user' do
      expect(policy).to permit(admin, action_item)
    end

    it 'denies access to non-admin users' do
      expect(policy).not_to permit(user, action_item)
    end
  end

  permissions :show? do
    it 'grants access to a user' do
      expect(policy).to permit(user, action_item)
    end
  end

  permissions :update? do
    it 'grants access to an admin user' do
      expect(policy).to permit(admin, action_item)
    end

    it 'denies access to non-admin users' do
      expect(policy).not_to permit(user, action_item)
    end
  end
end
