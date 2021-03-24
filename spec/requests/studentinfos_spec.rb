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



end