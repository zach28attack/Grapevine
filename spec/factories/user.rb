FactoryBot.define do
  factory :user do
    name { "Jogn" }
    email { "test@email.com" }
    password { 123456 }
    cals_budget { 2000 }
    protein_budget { 200 }
    fats_budget { 150 }
    carbs_budget { 100 }
  end

end