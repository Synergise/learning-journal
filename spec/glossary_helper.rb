# frozen_string_literal: true

def create_glossary_entry(glossary)
  click_link 'Glossary'
  click_link 'Create new entry'
  fill_in_glossary_form(glossary.term, glossary.definition)
  click_button 'Add entry'
end

def edit_glossary_entry(new_glossary)
  click_link 'Edit'
  fill_in_glossary_form(new_glossary.term, new_glossary.definition)
  click_button 'Update'
end

def fill_in_glossary_form(term, definition)
  fill_in 'Term', with: term
  fill_in 'Definition', with: definition
end
