module Sortable
  extend ActiveSupport::Concern

  # rubocop:disable Metrics/BlockLength
  included do
    before_create :add_to_list_top
    before_validation :check_top_position
    before_destroy :lock!
    after_destroy :decrement_positions_on_lower_items

    def add_to_list_top
      if default_position?
        # rubocop:disable Rails/SkipsModelValidations
        self.class.update_all('position = position + 1')
      else
        self.class
            .where('position >= ?', position)
            .update_all('position = position + 1')
      end
    end

    def bottom_position_in_list
      item = self.class.order(position: :desc).first
      item ? item.position : 0
    end

    def check_top_position
      return unless position &&
                    !default_position? &&
                    position.negative?

      self.position = 0
    end

    def decrement_positions_on_lower_items
      self.class
          .where('position > ?', position)
          .update_all('position = position - 1')
    end

    def default_position
      self.class.columns_hash['position'].default
    end

    def default_position?
      default_position && default_position.to_i == position
    end
  end
end
