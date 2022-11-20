class Lease < ApplicationRecord
    validates :rent, numericality: { only_integer: true }
    belongs_to :tenant
    belongs_to :apartment
end
