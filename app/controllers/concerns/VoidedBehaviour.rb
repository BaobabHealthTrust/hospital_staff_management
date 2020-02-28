module VoidedBehaviour
  extend ActiveSupport::Concern
  require 'date'

  included do
    default_scope { where(voided: nil) }
  end
end