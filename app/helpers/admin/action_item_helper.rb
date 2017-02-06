module Admin
  module ActionItemHelper
    def options_for_action_items_priority_select
      ActionItem.priorities.map do |priority|
        [
          I18n.t(
            priority.first,
            scope: 'activerecord.attributes.action_item.priorities',
          ),
          priority.first,
        ]
      end
    end

    def options_for_action_items_category_select
      Category.order(name: :asc).all.map do |category|
        [
          category.name,
          category.id,
        ]
      end
    end

    def options_for_action_items_issue_select
      Issue.order(name: :asc).all.map do |issue|
        [
          issue.name,
          issue.id,
        ]
      end
    end
  end
end
