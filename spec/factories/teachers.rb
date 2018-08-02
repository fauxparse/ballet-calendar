FactoryBot.define do
  sequence(:counter)

  factory :teacher do
    transient do
      counter { generate(:counter) }
    end

    first_name { 'Teacher' }
    last_name { counter }
    email { "teacher##{counter}@gmail.com" }
  end
end
