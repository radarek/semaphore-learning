require 'rails_helper'

RSpec.describe User, type: :model do
  it 'can be instantiated' do
    expect(User.new).to be_an_instance_of(User)
  end

  it 'calls User method' do
    expect(subject.first_name).to eq 'first_name'
  end

  it 'calls Post method' do
    expect(Post.new.title).to eq 'title'
  end
end
