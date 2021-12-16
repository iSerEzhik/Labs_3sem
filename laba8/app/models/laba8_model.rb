class Laba8Model < ApplicationRecord
  include ActiveModel::Validations
  validates :number, presence: true, uniqueness: true
end
