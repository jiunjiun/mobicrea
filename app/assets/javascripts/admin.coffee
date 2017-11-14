#= require rails-ujs

#= require PixelAdmin/bootstrap.min
#= require PixelAdmin/pixeladmin.min

#= require noty

#= require_self
#= require_tree ./admin

$ ->
  # --- PixelAdmin setup start
  href   = window.location.pathname

  # Activate current nav item
  $('body > .px-nav')
    .find(".px-nav-item > a[href=\"#{href}\"]")
    .parent()
    .addClass('active')

  $('body > .px-nav').pxNav()
  $('body > .px-footer').pxFooter()
  # --- end PixelAdmin setup

  if $('.twzipcode').length
    $('.twzipcode').twzipcode()

  $.validator.methods.pattern = (value, element) ->
    @optional(element) or new RegExp(element.pattern).test(value)
  $.validator.messages.pattern = '無效的格式'
  $('#payment_form, form.simple_form.edit_invoice').pxValidate
    ignore: '.ignore'
    focusInvalid: false
