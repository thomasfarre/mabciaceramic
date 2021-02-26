require "administrate/field/base"

class HasOneAttachedField < Administrate::Field::Base
  def to_s
    data
  end
end
