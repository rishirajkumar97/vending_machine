# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  include Identifiable

  self.abstract_class = true
end
