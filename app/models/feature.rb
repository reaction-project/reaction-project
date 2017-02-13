class Feature < ApplicationRecord
  include Sortable

  belongs_to :action

  validates :position, presence: true
end
