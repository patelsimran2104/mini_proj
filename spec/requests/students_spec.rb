require 'rails_helper'

RSpec.describe "Students", type: :request do

  let(:student) { create(:student) }

  describe 'GET students#show' do
  context 'with valid params' do
    it 'Show User' do
      expect{
        get "/students/#{student.id}" , params: {
                  student: attributes_for(:student)
                }}.to change(Student,:count).by(1)
    end
  end
  end


  describe 'GET #new' do
    it 'New Student' do
      get '/students/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST Student#create' do
    context 'with valid params' do
      let(:student) do
        post '/students', params: {
          student: attributes_for(:student)
        }
      end
      it { expect { student }.to change(Student, :count).by(1) }
    end

    context 'with invalid params' do
      context 'having invalid collage' do
        let(:student) do
          post '/students', params: { :student => { :email => '', :password => '', :password_confirmation=> '' } }
        end     

        it { expect { student }.not_to change(Student, :count) }
      end
    end
  end

  describe 'PATCH #edit' do
    let(:student) { create(:student) }

    it 'renders the edit page user' do
      get "/students/#{student.id}/edit", params: { id: student.id,
                                                 student: attributes_for(:student) }
      expect(response).to render_template :edit
    end
  end

  

  describe 'PUT Student#update' do
    let(:new_attributes) do
      attributes_for(:student)
    end

    # let(:invalid_attributes) do
    #   attributes_for(:student, email: "abc")
    # end
    
    context 'with valid params' do
      it 'updates the user' do
        put "/students/#{student.id}", params: { id: student.id, student: new_attributes }
        expect(student.reload)
      end

      it 'redirects to the index page' do
        put "/students/#{student.id}", params: { id: student.id, student: new_attributes }
        expect(response).to redirect_to student_path
      end
    end

    context 'with invalid params' do
       
      before do
        put "/students/#{student.id}", params: { :student => { :email => 'asdfghjk', :password => 'ASDFGH', :password_confirmation=> 'ASDFGH' } }
      end

      # before do
      #   put "/students/#{student.id}", params: { id: student.id, student: invalid_attributes }
      # end

      it 'updates the user' do
        student.reload
        expect(student.email).not_to eq 'abc'
      end

      it 'renders the edit page' do
        expect(response).to render_template :edit
      end
    end
  end

  describe 'Delete Student#destroy' do
    context 'with valid params' do
      let(:student) { create :student }
      let(:delete_student) do
        delete "/students/#{student.id}", params: { id: student.id }
      end

      it { expect { delete_student }.to change(Student, :count).by(0) }
    end

    context 'with invalid valid params' do
      let(:delete_student) do
        delete "/students/#{student.id}", params: { id: '' }
      end

      it { expect { delete_student }.not_to change(Student, :count) }
    end
  end

end
