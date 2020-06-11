# frozen_string_literal: true

def create_glossary_entry(glossary)
  click_link 'Glossary'
  click_link 'Create new entry'
  fill_in 'Term', with: glossary.term
  fill_in 'Definition', with: glossary.definition
  click_button 'Add entry'
end

def edit_glossary_entry(new_glossary)
  click_link 'Edit'
  fill_in 'Term', with: new_glossary.term
  fill_in 'Definition', with: new_glossary.definition
  click_button 'Update'
end
