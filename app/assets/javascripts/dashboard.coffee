$('document').ready ->
  update_status = (url, status) ->
    $.ajax
      url: url
      type: 'PATCH'
      data:
        status: status
      success: (data) ->
        alert(data.name)
        return

  power_on = (url) ->
    update_status(url, 'active')
    return

  shutdown = (url) ->
    update_status(url, 'off')
    return

  $('.button_on').click (e) ->
    input = $(this).parent().find('.update_url')
    url = input.val()
    power_on(url)
    return

  $('.button_off').click (e) ->
    input = $(this).parent().find('.update_url')
    url = input.val()
    shutdown(url)
    return
