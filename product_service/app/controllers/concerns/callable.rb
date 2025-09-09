module Callable
  extend ActiveSupport::Concern

  class_methods do
    def call(*args, &block)
      new(*args, &block).call
    rescue ActiveRecord::RecordNotFound => e
      { success: false, data: nil, error: "Record not found: #{e.message}" }
    rescue StandardError => e
      Rails.logger.error "#{name} failed: #{e.message}\n#{e.backtrace.join("\n")}"
      { success: false, data: nil, error: e.message }
    end
  end
end