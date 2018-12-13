require 'rails_helper'

RSpec.describe Student, type: :model do
  
  describe "before action" do
    before :all do
      @school = FactoryBot.create(:school)
      @student = FactoryBot.create(:student, school_id: @school.id)
    end
    
    describe "validations" do
      it { should validate_presence_of :student_number }
      it { should validate_presence_of :name }
      it { should validate_presence_of :gpa }
    end
    it 'has a student number lower bound' do
      should validate_numericality_of(:student_number).
      is_greater_than_or_equal_to(0)
    end

    it 'as a student number higer bound' do
      should validate_numericality_of(:student_number).
      is_less_than_or_equal_to(10000)
    end
  
    describe "uniqueness" do
      it { should validate_uniqueness_of(:name) }
    end

    describe "association" do
      it { should belong_to(:school) }
    end

  end
end 