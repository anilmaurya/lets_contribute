$ ->
  $('.button-collapse').sideNav()
  $('.parallax').parallax()

  engine = new Bloodhound(
    datumTokenizer: Bloodhound.tokenizers.obj.whitespace('name')
    queryTokenizer: Bloodhound.tokenizers.whitespace
    local: languages
  )

  engine.initialize()

  $('.typeahead').typeahead({
    hint: true
    highlight: true
    minLength: 1
  },
  {
    name: 'id'
    display: 'name'
    source: engine.ttAdapter()
  })


  $('.typeahead').bind('typeahead:select', (ev, suggestion) ->
    $.get('/issues?language_id=' + suggestion.id)
  )
