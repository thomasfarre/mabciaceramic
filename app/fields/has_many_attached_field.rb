require "administrate/field/base"

class HasManyAttachedField < Administrate::Field::Base
  def self.permitted_attribute(attr, _options = nil)
    { "#{attr.to_s}".to_sym => [] }
  end

  def to_s
    data
  end
end
