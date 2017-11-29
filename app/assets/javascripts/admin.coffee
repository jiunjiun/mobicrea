#= require rails-ujs

#= require PixelAdmin/bootstrap.min
#= require PixelAdmin/pixeladmin.min

#= require jquery-ui/widgets/sortable

#= require noty

#= require_self
#= require_tree ./admin

#= require summernote
#= require summernote/locales/zh-TW

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


  # Summernote Editor
  sendFile = (file, toSummernote) ->
    data = new FormData
    data.append 'summernote_upload[image]', file
    if gon.product_id
      data.append 'summernote_upload[product_id]', gon.product_id
    $.ajax
      data: data
      type: 'POST'
      url: gon.admin_summernote_upload
      cache: false
      contentType: false
      processData: false
      success: (data) ->
        console.log 'file uploading...'
        toSummernote.summernote "insertImage", data.url

  $('[data-provider="summernote"]').each ->
    $(this).summernote
      lang: 'zh-TW'
      height: 300
      codemirror:
        lineWrapping: true
        lineNumbers: true
        tabSize: 2
        theme: 'solarized'
      callbacks:
        onImageUpload: (files) ->
          sendFile files[0], $(this)
