# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BeverageIngredient, type: :model do
  let(:beverage_ingredient) { %i[units] }

  describe 'BeverageIngredient Validations' do
    context 'validate presence of mandatory keys' do
      it 'validates presence of mandatory fields' do
        beverage_ingredient.each do |key|
          should validate_presence_of key
        end
      end
    end

    context 'validate belongs_to association' do
      it { should belong_to(:beverage) }
      it { should belong_to(:ingredient) }
    end
  end
end
