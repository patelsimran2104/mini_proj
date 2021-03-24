require 'rails_helper'

RSpec.describe Result, type: :model do

  let(:result) { create(:result) }

  it "is valid with valid attributes" do
    expect(result).to be_valid
  end
end