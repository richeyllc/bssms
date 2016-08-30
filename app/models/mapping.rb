class Mapping < ApplicationRecord
  belongs_to :mapping_type
  belongs_to :group
end
