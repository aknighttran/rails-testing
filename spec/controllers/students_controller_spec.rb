require 'rails_helper'

RSpec.describe StudentsController, type: :controller do
  # Write your test below
  # it will be easier to test this controller with factory bot
    # you would have to add the gem and configure it.
  describe "before action" do
    before :each do
      @school = FactoryBot.create(:school)
      @student = FactoryBot.create(:student, school_id: @school.id)
    end
    
    describe "GET #index" do
      it "returns http success" do
        get :index, params: { school_id: @school.id}
        expect(response).to be_successful
      end
    end
  end
end
