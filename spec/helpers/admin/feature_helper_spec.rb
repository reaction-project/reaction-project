require 'rails_helper'

module Admin
  RSpec.describe FeatureHelper, type: :helper do
    describe '#options_for_feature_actions_select' do
      it 'returns an array of values for actions' do
        expected = Action.order(title: :asc).all.map do |action|
          [
            action.title,
            action.id,
          ]
        end

        expect(helper.options_for_feature_actions_select)
          .to match_array(expected)
      end
    end
  end
end
