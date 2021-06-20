# frozen_string_literal: true

require 'rails_helper'

RSpec.describe VendingController, type: :controller do
  let(:beverages_mock) { FactoryBot.attributes_for(:beverages_mock) }
  let(:beverage_response) { FactoryBot.attributes_for(:beverages_list_mock) }
  let(:beverage) { double(:Beverage, beverages_mock) }
  let(:ingredient) { Ingredient.new(id: SecureRandom.uuid, name: 'tea', units: 10) }
  let(:ingredient_equal) { Ingredient.new(id: SecureRandom.uuid, name: 'tea', units: 1) }
  let(:beverage_ingredient) { BeverageIngredient.new(id: SecureRandom.uuid ,ingredient_id: ingredient_equal.id, beverage_id: id, units: 1 )}
  let(:beverage_ingredient_1) { BeverageIngredient.new(id: SecureRandom.uuid ,ingredient_id: ingredient_equal.id, beverage_id: id, units: 2 )}
  let(:id) { SecureRandom.uuid}
  describe '#index' do
    context 'when request params are valid' do
      before do
        allow(BeverageIngredient).to receive(:where).and_return([beverage_ingredient])
        allow(Ingredient).to receive(:find_by!).and_return(ingredient)
      end

      it 'Successfully dispenses' do
        get :index, params: { id: SecureRandom.uuid }
        expect(response.status).to eq 200
        expect(JSON.parse(response.body)['status']).to eq('Dispensed')
      end
    end

    context 'when request params are valid and equal to total ingredients' do
      before do
        allow(BeverageIngredient).to receive(:where).and_return([beverage_ingredient])
        allow(Ingredient).to receive(:find_by!).and_return(ingredient_equal)
        allow(Ingredient).to receive(:where).and_return([ingredient_equal])
        allow(ingredient).to receive(:update).and_return(true)
      end

      it 'successfully dispenses and throws the empty ingredients in the response' do
        get :index, params: { id: id }
        expect(response.status).to eq 200
        expect(JSON.parse(response.body)['status']).to eq('Dispensed')
      end
    end

    context 'when request params are valid and equal to total ingredients' do
      before do
        allow(BeverageIngredient).to receive(:where).and_return([beverage_ingredient_1])
        allow(Ingredient).to receive(:find_by!).and_return(ingredient_equal)
        allow(Ingredient).to receive(:where).and_return([ingredient_equal])
        allow(ingredient).to receive(:update).and_return(true)
      end

      it 'raises error as it cant be dispensed' do
        get :index, params: { id: id }
        expect(response.status).to eq 400
      end
    end
  end
end
