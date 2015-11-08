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
    $('input[name="language"]').data('id', suggestion.id);
    $.get('/issues?language_id=' + suggestion.id);
  )

  $('body').on 'click', 'button:contains(Next)', ->
    $.get('/issues?language_id=' + $('input[name="language"]').data('id'))
