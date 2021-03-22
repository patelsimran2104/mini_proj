require 'rails_helper'

RSpec.describe Studentinfo, type: :model do
  let(:studentinfo) { create(:studentinfo) }

  it "is valid with valid attributes" do
    expect(studentinfo).to be_valid
  end
  
  
end
