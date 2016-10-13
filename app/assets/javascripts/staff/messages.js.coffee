ready = ->
  if $('#number-of-unprocessed-messages').length
    setInterval(update_number_of_unprocessed_messages, 1000 * 20)

update_number_of_unprocessed_messages = ->
  $.get window.path_for("count_staff_messages"), (data) ->
    $('#number-of-unprocessed-messages').text "(#{data})"

$(document).ready(update_number_of_unprocessed_messages)
$(document).on('page:change', update_number_of_unprocessed_messages)
