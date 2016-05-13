$('document').ready ->
  setInterval (->
    check_action()
    return
  ), 3000

  $('#btn_refresh').bind "click", (e) ->
    refresh_droplets()
    log_info("Droplets atualizados!")
    return

  log_info = (info) ->
    message = "<b>[#{new Date()}]</b> Info: #{info}"
    $('.well').append("#{message}<br>" )
    return


  log_action = (action) ->
    message = "<b>[#{new Date()}]</b> Type: #{action.action_type} - Status: #{action.status}"
    $('.well').append("#{message}<br>" )
    return

  check_action = (droplet_id) ->
    $.ajax
      url: "/actions/check"
      type: 'GET'
      success: (data) ->
        $.each data, (index, item) ->
          if item.action.status == "completed"
            log_action(item.action)
          return

  refresh_droplets = () ->
    $.ajax
      beforeSend: () ->
        $('#droplets').html('<i class="fa fa-spinner fa-pulse fa-3x fa-fw margin-bottom"></i><span class="sr-only">Loading...</span>')
        return
      url: "/droplets"
      type: 'GET'
      success: (data) ->
        $('#droplets').html(data.html)
        bind_action_events()
        return

  update_status = (url, status) ->
    $.ajax
      url: url
      type: 'PATCH'
      data:
        status: status
      success: (data) ->
        log_action(data.action)
        return

  power_on = (url) ->
    $('.button_on').prop('disabled', true)
    update_status(url, 'active')
    return

  shutdown = (url) ->
    $('.button_off').prop('disabled', true)
    update_status(url, 'off')
    return

  bind_action_events = ->
    $('.button_on').bind "click", (e) ->
      input = $(this).parent().find('.update_url')
      url = input.val()
      power_on(url)
      return

    $('.button_off').bind "click", (e) ->
      input = $(this).parent().find('.update_url')
      url = input.val()
      shutdown(url)
      return
    return

  bind_action_events()
