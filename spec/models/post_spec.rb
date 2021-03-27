require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'can be instantiated' do
    expect(Post.new).to be_an_instance_of(Post)
  end

  it 'calls title method' do
    expect(subject.title).to eq 'title'
    expect(subject.body).to eq 'body'
  end

  it 'calls User method' do
    expect(User.new.last_name).to eq 'last_name'
  end
end
