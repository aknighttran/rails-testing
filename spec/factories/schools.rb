FactoryBot.define do
  factory :school, class: School do
    name {'Devpoint'}
    address {'300 e 400 s'}
    principal {'Henry'}
    capacity {52000}
    private_school {true}
  end
end
