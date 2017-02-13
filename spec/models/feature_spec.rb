require 'rails_helper'

RSpec.describe Feature, type: :model do
  it { is_expected.to validate_presence_of(:position) }

  context 'when creating' do
    before do
      create_list(:feature, 2)
    end

    it 'adds the feature with a top position' do
      feature = create(:feature, position: 0)
      expect(feature.position).to eq(0)
    end

    it 'moves other features to lower positions' do
      feature = create(:feature, position: 0)
      create(:feature, position: 0)

      feature.reload
      expect(feature.position).to eq(1)
    end
  end

  context 'after destroying' do
    let(:feature) { create(:feature, position: 0) }

    it 'decrements the positions on lower items' do
      feature2 = create(:feature, position: 1)
      feature3 = create(:feature, position: 2)

      feature2.destroy
      feature3.reload
      expect(feature3.position).to eq(1)
    end
  end
end
