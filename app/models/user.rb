class User < ApplicationRecord
  def first_name
    'first_name'
  end

  def last_name
    new_record? ? 'last_name' : super
  end
end
