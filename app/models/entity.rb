class Entity < ApplicationRecord
  belongs_to :contact_info
  belongs_to :address
end
