# frozen_string_literal: true

class Shared::ErrorMessageComponent < ViewComponent::Base
  def initialize(object:)
    @object = object
  end

end
