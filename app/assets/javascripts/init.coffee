$ ->
  $('.button-collapse').sideNav()
  $('.parallax').parallax()
  $('select').material_select()

  $('#language_select').change ->
    $.get('/issues', (data) ->
      console.log data
    )
