require 'rails_helper'

RSpec.describe IssuePolicy do
  subject(:policy) { described_class }

  let(:admin) { build_stubbed(:user, :admin) }
  let(:user) { build_stubbed(:user) }
  let(:issue) { build_stubbed(:issue) }

  permissions :create? do
    it 'grants access to an admin user' do
      expect(policy).to permit(admin, issue)
    end

    it 'denies access to non-admin users' do
      expect(policy).not_to permit(user, issue)
    end
  end

  permissions :destroy? do
    it 'grants access to an admin user' do
      expect(policy).to permit(admin, issue)
    end

    it 'denies access to non-admin users' do
      expect(policy).not_to permit(user, issue)
    end
  end

  permissions :edit? do
    it 'grants access to an admin user' do
      expect(policy).to permit(admin, issue)
    end

    it 'denies access to non-admin users' do
      expect(policy).not_to permit(user, issue)
    end
  end

  permissions :index? do
    it 'grants access to a user' do
      expect(policy).to permit(user, issue)
    end
  end

  permissions :new? do
    it 'grants access to an admin user' do
      expect(policy).to permit(admin, issue)
    end

    it 'denies access to non-admin users' do
      expect(policy).not_to permit(user, issue)
    end
  end

  permissions :show? do
    it 'grants access to a user' do
      expect(policy).to permit(user, issue)
    end
  end

  permissions :update? do
    it 'grants access to an admin user' do
      expect(policy).to permit(admin, issue)
    end

    it 'denies access to non-admin users' do
      expect(policy).not_to permit(user, issue)
    end
  end
end
