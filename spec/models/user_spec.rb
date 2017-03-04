require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  it do
    is_expected.to define_enum_for(:role).with(user: 0, admin: 1, ambassador: 2)
  end
end
