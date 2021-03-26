require 'rails_helper'

RSpec.describe "Results", type: :request do
  let(:student) { create(:student) }
  let(:result) { create(:result) }

  describe 'GET Result#index' do
    context 'Get Student List' do
      it 'Get index' do
        get "/students/#{student.id}/results"
        expect(response).to render_template :index
      end
    end
  end

  describe 'GET results#new' do
    it 'New Studentinfo' do
      get "/students/#{student.id}/results/new", params: {
        student_id: student.id,
        id: result.id,
        result: attributes_for(:result)
    }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST results#create' do
    context 'with valid params' do
      let(:result) do
        post "/students/#{student.id}/results", params: {
          id: student.id,
          result: attributes_for(:result)
        }
      end
      it { expect { result }.to change(Result, :count).by(1) }
    end

    context 'with invalid params' do
      context 'having invalid Result' do
        
        let(:result) do
          post "/students/#{student.id}/results", params: { id: student.id, :result => { :subjects => '', :gread => '' } }
        end     

        it { expect { result }.not_to change(Result, :count) }
      end
    end
  end

  describe 'GET #edit' do
    it 'renders the edit page user' do
      result.student_id = student.id
      get "/students/#{student.id}/results/#{result.id}/edit", params: { id: result.id,
                                                student_id: student.id,
                                                result: attributes_for(:result) }
      expect(response).to render_template :edit
    end
  end

  describe 'POST results#update' do
  let(:student) { create(:student) }
  
  
    let(:new_attributes) do
      attributes_for(:result)
    end
    
    context 'with valid params' do
      it 'updates the user' do
        result.student_id = student.id
        post "/students/#{student.id}/results/#{result.id}", params: { id: result.id, student_id: student.id, result: new_attributes }
        expect(result.reload)
      end

      it 'redirects to the index page' do
        result.student_id = student.id
        post "/students/#{student.id}/results/#{result.id}", params: { id: result.id, student_id: result.student_id, result: new_attributes }
        expect(response).to redirect_to student_results_path
      end
    end

    context 'with invalid params' do
       
      before do
        post "/students/#{student.id}/results/#{result.id}", params: { :result => { :subjects => '', :gread => ''} }
      end

      it 'updates the user' do
        result.student_id = student.id
        result.reload
        expect(result.subjects).not_to eq 'abc'
      end

      it 'renders the edit page' do
        result.student_id = student.id
        expect(response).to render_template :edit
      end
    end
  end

end
