# frozen_string_literal: true

#:nodoc:
module GlossaryHelper
  def render_errors(record)
    errors_to_render = record.errors
    errors_to_render.messages.any? ? errors_to_render.full_messages : []
  end
end
