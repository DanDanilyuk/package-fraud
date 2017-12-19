require 'active_support/concern'

module Error
  extend ActiveSupport::Concern
  included do
    rescue_from ActiveRecord::RecordInvalid do |exception|
      json_response({ message: exception.message }, :not_acceptable)
    end
  end
end
