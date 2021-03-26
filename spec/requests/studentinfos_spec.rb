require 'rails_helper'

RSpec.describe "Studentinfos", type: :request do
  let(:student) { create(:student) }
  let(:studentinfo) { create(:studentinfo) }

  describe 'GET studentinfos#show' do
		context 'with valid params' do
			it 'Show User' do
        studentinfo.student_id = student.id
        get "/students/#{studentinfo.student_id}/studentinfos/#{studentinfo.id}" , params: {
                    student_id: student.id,
                    id: studentinfo.id,
                    studentinfo: attributes_for(:studentinfo)
                  }
				expect(response).to have_http_status(:success)
			end
		end
	end
  
  describe 'GET studentinfos#new' do
    it 'New Studentinfo' do
      studentinfo.student_id = student.id
      get "/students/#{student.id}/studentinfos/new", params: {
        student_id: student.id,
        id: studentinfo.id,
        studentinfo: attributes_for(:studentinfo)
    }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST studentinfos#create' do
    context 'with valid params' do
      let(:studentinfo) do
        post "/students/#{student.id}/studentinfos", params: {
          id: student.id,
          studentinfo: attributes_for(:studentinfo)
        }
      end
      it { expect { studentinfo }.to change(Studentinfo, :count).by(1) }
    end

    context 'with invalid params' do
      context 'having invalid collage' do
        
        let(:studentinfo) do
          post "/students/#{student.id}/studentinfos", params: { id: student.id, :studentinfo => { :name => '', :address => '', :phoneNo => '', :gender => '', :dob => '' } }
        end     

        it { expect { studentinfo }.not_to change(Studentinfo, :count) }
      end
    end
  end

  describe 'GET #edit' do
    it 'renders the edit page user' do
      get "/students/#{student.id}/studentinfos/#{studentinfo.id}/edit", params: { id: studentinfo.id,
                                                student_id: student.id,
                                                studentinfo: attributes_for(:studentinfo) }
      expect(response).to render_template :edit
    end
  end

  describe 'PUT studentinfos#update' do
  let(:student) { create(:student) }
  let(:studentinfo) { create(:studentinfo) }
    let(:new_attributes) do
      attributes_for(:studentinfo)
    end
    
    context 'with valid params' do
      it 'updates the user' do
        put "/students/#{student.id}/studentinfos/#{studentinfo.id}", params: { id: studentinfo.id, student_id: student.id, studentinfo: new_attributes }
        expect(studentinfo.reload)
      end

      it 'redirects to the show page' do
        put "/students/#{student.id}/studentinfos/#{studentinfo.id}", params: { id: studentinfo.id, student_id: student.id, studentinfo: new_attributes }
        expect(response).to redirect_to student_studentinfo_path
      end
    end

    context 'with invalid params' do
       
      before do
        put "/students/#{student.id}/studentinfos/#{studentinfo.id}", params: { :studentinfo => { :name => '', :address => '', :phoneNo=> '' } }
      end

      it 'updates the user' do
        student.reload
        expect(studentinfo.name).not_to eq 'abc'
      end

      it 'renders the edit page' do
        expect(response).to render_template :edit
      end
    end
  end

  describe 'Delete studentinfos#destroy' do
    context 'with valid params' do
      let(:studentinfo) { create :studentinfo }
      let(:delete_studentinfo) do
        delete "/students/#{student.id}/studentinfos/#{studentinfo.id}", params: { id: studentinfo.id }
      end

      it { expect { delete_studentinfo }.to change(Studentinfo, :count).by(0) }
    end

    context 'with invalid valid params' do
      let(:delete_studentinfo) do
        delete "/students/#{student.id}", params: { id: '' }
      end

      it { expect { delete_studentinfo }.not_to change(Studentinfo, :count) }
    end
  end

end