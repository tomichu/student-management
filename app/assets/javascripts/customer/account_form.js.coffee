ready = ->
  return if $('div.confirming').length
  toggle_manage_student_fields()
  toggle_home_address_fields()
  toggle_work_address_fields()
  $('input#form_inputs_manage_student').click ->
    toggle_manage_student_fields()
  $('input#form_inputs_home_address').click ->
    toggle_home_address_fields()
  $('input#form_inputs_work_address').click ->
    toggle_work_address_fields()

toggle_manage_student_fields = ->
  checked = $('input#form_inputs_manage_student').prop('checked')
  $('fieldset#manage-student-fields input').prop('disabled', !checked)
  $('fieldset#manage-student-fields select').prop('disabled', !checked)
  $('fieldset#manage-student-fields').toggle(checked)

toggle_home_address_fields = ->
  checked = $('input#form_inputs_home_address').prop('checked')
  $('fieldset#home-address-fields input').prop('disabled', !checked)
  $('fieldset#home-address-fields select').prop('disabled', !checked)
  $('fieldset#home-address-fields').toggle(checked)

toggle_work_address_fields = ->
  checked = $('input#form_inputs_work_address').prop('checked')
  $('fieldset#work-address-fields input').prop('disabled', !checked)
  $('fieldset#work-address-fields select').prop('disabled', !checked)
  $('fieldset#work-address-fields').toggle(checked)
$(document).ready(ready)
$(document).on('page:change', ready)
