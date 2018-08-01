FactoryBot.define do
  sequence(:counter)

  factory :teacher do
    transient do
      counter { generate(:counter) }
    end

    name { "Teacher ##{counter}" }
    email { "teacher##{counter}@gmail.com" }
  end
end
