module Admin
  module UserHelper
    def options_for_user_role_select
      User.roles.map do |role|
        [
          I18n.t(
            role.first,
            scope: 'activerecord.attributes.user.roles',
          ),
          role.first,
        ]
      end
    end
  end
end
