def create_glossary_entry(glossary)
  click_link 'Glossary'
  click_link 'Create new entry'
  fill_in 'Term', with: glossary.term
  fill_in 'Definition', with: glossary.definition
  click_button 'Add entry'
end