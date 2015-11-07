module ApplicationHelper
  def languages_select
    options_for_select([['Which Language ?', 'lang']], selected: 'lang', disabled: 'lang') + \
      options_from_collection_for_select(@languages, :id, :name)
  end
end
