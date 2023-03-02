FactoryBot.define do
  factory :food do
    food_name {"milk"}
    calories { 200 }
    protein { 20 }
    fats { 15 }
    carbs { 10 }
    servings { 1 }
  end
end