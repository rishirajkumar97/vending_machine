# frozen_string_literal: true

class Beverage < ApplicationRecord
  validates :beverage_name, presence: true
  validates_uniqueness_of :beverage_name, case_sensitive: false
end
