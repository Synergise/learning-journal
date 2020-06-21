# frozen_string_literal: true

#:nodoc:
module GlossaryHelper
  def render_errors(record)
    record.errors.messages.any? ? record.errors.full_messages : []
  end
end
