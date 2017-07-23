class Info < ActiveRecord::Base
  belongs_to :user


  def if_absent
      self
  end

  def if_present
      yield
      self
  end
end
