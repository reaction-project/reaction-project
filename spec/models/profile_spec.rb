require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe '#full_name' do
    context 'with no first or last name' do
      let(:profile) { create(:profile, first_name: nil, last_name: nil) }

      it 'returns nil' do
        expect(profile.full_name).to be_nil
      end
    end

    context 'with a first name' do
      let(:profile) do
        create(:profile, first_name: Faker::Name.first_name, last_name: nil)
      end

      it 'returns the first name' do
        expect(profile.full_name).to eq(profile.first_name)
      end
    end

    context 'with a last name' do
      let(:profile) do
        create(:profile, first_name: nil, last_name: Faker::Name.last_name)
      end

      it 'returns the last name' do
        expect(profile.full_name).to eq(profile.last_name)
      end
    end

    context 'with a first and last name' do
      let(:profile) do
        create(
          :profile,
          first_name: Faker::Name.first_name,
          last_name: Faker::Name.last_name,
        )
      end

      it 'returns the first and last name' do
        expect(profile.full_name)
          .to eq("#{profile.first_name} #{profile.last_name}")
      end
    end
  end
end
