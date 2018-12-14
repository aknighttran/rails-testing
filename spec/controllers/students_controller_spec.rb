require 'rails_helper'

RSpec.describe StudentsController, type: :controller do
  # Write your test below
  # it will be easier to test this controller with factory bot
    # you would have to add the gem and configure it.
    let(:valid_attributes) {
    { 
      name: 'Bobby', 
      student_number: 1234, 
      gpa: 4.0,
      school_id: 1
    }
  }

  let(:invalid_attributes) {
    { 
      name: '', 
      student_number: 1234, 
      gpa: 4.0, 
    }
  }

  describe "before action" do
    before :all do
      @school = FactoryBot.create(:school)
      @student = FactoryBot.create(:student, school_id: @school.id)
      
    end
    
    describe "GET #index" do
      it "returns http success" do
        get :index, params: { school_id: @school.id}
        expect(response).to be_successful
      end
    end

    describe "GET #show" do
      it "returns http success" do
        get :show, params: { school_id: @school.id, id: @student.id}
        expect(response).to be_successful
      end
    end

    describe "GET #new" do
      it "returns http success" do
        get :new, params: { school_id: @school.id}
        expect(response).to be_successful
      end
    end

    describe "GET #edit" do
      it "returns http success" do
        get :show, params: { school_id: @school.id, id: @student.id}
        expect(response).to be_successful  
      end
    end

    describe "GET #create" do
      context "with valid params" do
        it "creates a new student" do
          expect {
            post :create, params: {school_id: @school.id, student: valid_attributes }
          }.to change(Student, :count).by(1)
        end
        
        it "redirects to the created student" do
          post :create, params: {school_id: @school.id, student: valid_attributes }
          expect(response).to redirect_to(school_student_path(@school, Student.last))
        end
      end
      
      context "with invalid params" do
        it "does not creates a new school" do
          expect {
            post :create, params: {school_id: @school.id, student: invalid_attributes }
          }.to change(Student, :count).by(0)
        end
  
        it "redirects to new template" do
          post :create, params: { school_id: @school.id, student: invalid_attributes }
          expect(response).to be_successful
        end
      end
    end

    describe "PUT #update" do
      context "with valid params" do
        let(:new_attributes) {
          { gpa: 3.9 }
        }

        it "update the student" do
          put :update, params: {school_id: @school.id, id: @student.id, student: new_attributes }
          @student.reload
          expect(@student.gpa).to eq(new_attributes[:gpa])
        end
        
        it "redirect to the school updated" do
          put :update, params: {school_id: @school.id, id: @student.id, student: new_attributes }
          expect(response).to redirect_to(school_student_path(@school, Student.last))
        end
      end

      context "with invalid params" do
        let(:new_invalid_attributes) {
          { gpa: '' }
        }

        it "does not update the student" do
          put :update, params: {school_id: @school.id, id: @student.id, student: new_invalid_attributes }
          @student.reload
          expect(@student.gpa).to_not eq(new_invalid_attributes[:gpa])
        end
  
        it "redirect to the edit form" do
          put :update, params: {school_id: @school.id, id: @student.id, student: new_invalid_attributes }
          expect(response).to be_successful
        end
      end
      
    end

    describe "DELETE #destroy" do
      it "destroys the requested student" do 
        expect {
          delete :destroy, params: { school_id: @school.id, id: @student.id}
        }.to change(Student, :count).by(-1)
      end

      it "redirects to the student list" do
        delete :destroy, params: { school_id: @school.id, id: @student.id}
        expect(response).to redirect_to(school_students_url)
      end
    end


  end
end
