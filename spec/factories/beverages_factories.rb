# frozen_string_literal: true

FactoryBot.define do
  factory :beverages_mock, class: Hash do
    id { SecureRandom.uuid }
    beverage_name { 'Tea' }
    beverage_ingredients do
      [
        {
          name: 'tea',
          units: 1
        }
      ]
    end
    created_at { Time.now.utc.to_s }
    updated_at { Time.now.utc.to_s }
  end

  factory :beverages_list_mock, class: Hash do
    items { [FactoryBot.attributes_for(:beverages_mock)] }
    totalResults { 1 }
  end

  factory :beverage_post_data, class: Hash do
    name { 'Tea' }
    beverage_ingredients do
      [
        {
          name: 'tea',
          units: 1
        }
      ]
    end
  end

  factory :beverages_post_data_multiple, class: Hash do
    name { 'coke' }
    locale_texts do
      [
        {
          name: 'sugar',
          units: 2
        },
        {
          name: 'milk',
          units: 1
        }
      ]
    end
  end

  factory :id_params, class: Hash do
    id { SecureRandom.uuid }
  end
end
