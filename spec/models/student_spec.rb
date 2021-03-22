require 'rails_helper'

RSpec.describe Student, type: :model do
  let(:student) { create(:student) }

  it "is not valid without email" do
    student.email = nil
    expect(student).to_not be_valid
  end
  
  
end
