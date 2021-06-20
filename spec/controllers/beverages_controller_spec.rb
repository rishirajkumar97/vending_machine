# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BeveragesController, type: :controller do
  let(:beverages_mock) { FactoryBot.attributes_for(:beverages_mock) }
  let(:beverage_data) { FactoryBot.attributes_for(:beverage_post_data) }
  let(:post_data_multiple) { FactoryBot.attributes_for(:beverages_post_data_multiple) }
  let(:beverage_response) { FactoryBot.attributes_for(:beverages_list_mock) }
  let(:params) { FactoryBot.attributes_for(:id_params) }
  let(:beverage) { double(:Beverage, beverages_mock) }
  let(:ingredient) { Ingredient.new(id: SecureRandom.uuid, name: 'tea', units: 10) }

  describe '#create' do
    context 'when request params are valid' do
      before do
        allow(Beverage).to receive(:create!).and_return(beverages_mock)
        allow(Ingredient).to receive(:find_by!).and_return(ingredient)
      end

      it 'creates policy_text' do
        post :create, params: beverage_data
        expect(response.status).to eq 201
        expect(JSON.parse(response.body)).to eq(beverages_mock.as_json)
      end
    end

    context 'when create! method raises error' do
      before do
        allow(Ingredient).to receive(:find_by!).and_return(ingredient)
        allow(Beverage).to receive(:create!).and_raise(ActiveRecord::RecordInvalid)
      end

      it 'returns 400 error' do
        post :create, params: beverage_data
        expect(response.status).to eq 400
      end
    end
  end

  describe '#show' do
    before do
      allow(Beverage).to receive(:find_by!).and_return(beverages_mock)
    end

    context 'when request params are valid' do
      it 'returns beverage item' do
        get :show, params: params
        expect(response.status).to eq 200
      end
    end
  end

  describe '#destroy' do
    context 'when request params are valid' do
      before do
        allow(Beverage).to receive(:find_by!).and_return(beverage)
        allow(beverage).to receive(:destroy!).and_return(true)
      end
      it 'deletes beverage' do
        delete :destroy, params: params
        expect(response.status).to eq 204
      end
    end
  end

  describe '#index'
  let(:collection) { double('ConfigList', { count: 1, items: [] }) }
  subject { get :index, params: {} }

  context 'when request params are valid' do
    before do
      allow(Beverage).to receive(:all).and_return(beverage_response[:items])
    end

    it 'returns beverage items' do
      subject
      expect(response.status).to eq 200
      response_body = JSON.parse(response.body)
      expect(response_body['total_results']).to eq(1)
    end
  end
end
