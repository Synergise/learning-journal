# frozen_string_literal: true

module GlossaryHelper
  def render_errors(record)
    @glossary.errors.messages.any? ? @glossary.errors.full_messages : []
  end
end
