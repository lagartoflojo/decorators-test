ActionController::Base.prepend_before_filter do
  BaseDecorator.helpers = self.view_context_class.new(nil, {}, self)
end