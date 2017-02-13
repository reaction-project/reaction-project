module Admin
  module FeatureHelper
    def options_for_feature_actions_select
      actions = Action.order(title: :asc).all

      actions.map do |action|
        [
          action.title,
          action.id,
        ]
      end
    end
  end
end
