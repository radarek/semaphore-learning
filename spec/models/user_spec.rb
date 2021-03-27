require 'rails_helper'

RSpec.describe User, type: :model do
  it 'can be instantiated' do
    expect(User.new).to be_an_instance_of(User)
  end
end
