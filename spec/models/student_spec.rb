require 'rails_helper'

RSpec.describe Student, type: :model do
  let(:student) { create(:student) }
  
  it "is valid with valid attributes" do
    expect(student).to be_valid
  end
  
  
end
