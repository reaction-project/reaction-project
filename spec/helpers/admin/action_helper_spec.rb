require 'rails_helper'

module Admin
  RSpec.describe ActionHelper, type: :helper do
    describe '#options_for_actions_priority_select' do
      it 'returns an array of localized values for priority selects' do
        expected = Action.priorities.map do |priority|
          [
            I18n.t(
              priority.first,
              scope: 'activerecord.attributes.action.priorities',
            ),
            priority.first,
          ]
        end

        expect(helper.options_for_actions_priority_select)
          .to match_array(expected)
      end
    end

    describe '#options_for_actions_category_select' do
      before do
        create_list(:category, 2)
      end

      it 'returns an array of values for categories' do
        expected = Category.order(name: :asc).all.map do |category|
          [
            category.name,
            category.id,
          ]
        end

        expect(helper.options_for_actions_category_select)
          .to match_array(expected)
      end
    end

    describe '#options_for_actions_issue_select' do
      it 'returns an array of values for issues' do
        expected = Issue.order(name: :asc).all.map do |issue|
          [
            issue.name,
            issue.id,
          ]
        end

        expect(helper.options_for_actions_issue_select)
          .to match_array(expected)
      end
    end
  end
end
