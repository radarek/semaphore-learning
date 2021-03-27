require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'can be instantiated' do
    expect(Post.new).to be_an_instance_of(Post)
  end
end
