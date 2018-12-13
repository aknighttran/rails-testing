FactoryBot.define do
  factory :student, class: Student do
    name {'Bob'}
    student_number { rand(0..100) }
    gpa {'4.0'}

    school
  end
end