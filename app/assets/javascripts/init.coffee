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

  scrollToIssue = ->
    $('html, body').animate({
        scrollTop: $('.issue_detail').offset().top
    }, 1000)

  $('.typeahead').bind('typeahead:select', (ev, suggestion) ->
    $('input[name="language"]').data('id', suggestion.id)
    $.get('/issues?language_id=' + suggestion.id)
    scrollToIssue()
  )

  $('body').on 'click', 'button:contains(Next), .feeling_lucky', ->
    id = $('input[name="language"]').data('id')
    if(id != undefined)
      $.get('/issues?language_id=' + $('input[name="language"]').data('id'))
    else
      $.get('/issues')
    scrollToIssue()
