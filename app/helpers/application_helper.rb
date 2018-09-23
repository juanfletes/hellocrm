module ApplicationHelper
  def attr_name(class_object, attribute_name)
    class_object.human_attribute_name(attribute_name).capitalize
  end
end
