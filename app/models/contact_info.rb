class ContactInfo < ApplicationRecord
  belongs_to :address
  belongs_to :entity
end
