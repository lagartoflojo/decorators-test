class BaseDecorator
  require 'active_support/core_ext/class/attribute'
  
  attr_accessor :model
  class_attribute :allowed, :helpers

  # list of model methods directly accessible
  self.allowed = [:id]

  def initialize(model)
    self.model = model
  end

  def helpers
    self.class.helpers
  end
  alias :h :helpers

  def self.allow(*methods)
    self.allowed += methods
  end

  def allowed?(method)
    allowed.include? method
  end

  # slow, but works for now
  def method_missing(method, *args, &block)
    super unless allowed? method
    model.send(method, *args, &block)
  end

end