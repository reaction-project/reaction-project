module Admin
  module ActionHelper
    def options_for_actions_priority_select
      Action.priorities.map do |priority|
        [
          I18n.t(
            priority.first,
            scope: 'activerecord.attributes.action.priorities',
          ),
          priority.first,
        ]
      end
    end

    def options_for_actions_category_select
      Category.order(name: :asc).all.map do |category|
        [
          category.name,
          category.id,
        ]
      end
    end

    def options_for_actions_issue_select
      Issue.order(name: :asc).all.map do |issue|
        [
          issue.name,
          issue.id,
        ]
      end
    end
  end
end
