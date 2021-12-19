# frozen_string_literal: true

class Laba8Model < ApplicationRecord
  include ActiveModel::Validations
  validates :number, presence: true, uniqueness: true

  def iterates=(iterates)
    super ActiveSupport::JSON.encode(iterates)
  end

  def iterates
    ActiveSupport::JSON.decode(super)
  end
end
