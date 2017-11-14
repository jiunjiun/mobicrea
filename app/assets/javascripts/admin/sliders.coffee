# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  if $('#dropzone_photo').length
    dropzone_photo = new Dropzone '#sliders #dropzone_photo',
      paramName: "slider[image]",
      parallelUploads: 2
      maxFilesize: 5
      dictDefaultMessage: '點擊此處以上傳照片(或直接將照片拉到此處)<br><div style="margin:30px"><i class="fa fa-cloud-upload fa-3x"></i></div>'
      dictRemoveFile: '移除檔案'
      dictCancelUpload: '取消上傳'
      dictInvalidFileType: '檔案格式錯誤，請上傳圖片'
      init: (e) ->
        thisDropzone = @
        $.getJSON gon.admin_sliders_path, (slider) ->
          $.each slider, (key, value) ->
            mockFile = { id: value.id, name: value.name, size: value.size, position: value.position }
            thisDropzone.options.addedfile.call(thisDropzone, mockFile)
            thisDropzone.options.thumbnail.call(thisDropzone, mockFile, value.url)
            thisDropzone.files.push(mockFile)
            $(thisDropzone.files[thisDropzone.files.length-1].previewElement).attr('data-id', value.id)

            el = $(thisDropzone.files[thisDropzone.files.length-1].previewTemplate)
            # dz_remove = el.find('.dz-remove').clone()
            # el.find('.dz-remove').remove()

            dz_show = $('<a/>', {
              href: "#{gon.admin_sliders_path}/#{value.id}/edit"
              class: 'dz-show'
              html: '檢視圖片'
            })
            el.append(dz_show)

      success: (file, response) ->
        if response.status == 'success'
          file.id = response.slider.id
          file.position = response.position
          # return file.previewElement.classList.add("dz-success")

          el = $(thisDropzone.files[thisDropzone.files.length-1].previewTemplate)
          # dz_remove = el.find('.dz-remove').clone()
          # el.find('.dz-remove').remove()

          dz_show = $('<a/>', {
            href: "#{gon.admin_sliders_path}/#{value.id}/edit"
            class: 'dz-show'
            html: '檢視圖片'
          })
          el.append(dz_show)

      removedfile: (file) ->
        $.ajax
          type: 'DELETE',
          url: "#{gon.admin_sliders_path}/#{file.id}",
          dataType: 'json'

        _ref = undefined
        if (_ref = file.previewElement) != null then _ref.parentNode.removeChild(file.previewElement) else undefined

    el = document.getElementById('dropzone_photo')
    sortable = Sortable.create el,
      animation: 200
      onUpdate: (evt) ->
        slider = {}

        $('#dropzone_photo .dz-preview').each (k, v) ->
          id = $(this).data('id')
          slider[id] = {position: k + 1}

        $.ajax
          type: 'PUT',
          url: gon.update_position_admin_sliders_path
          data: {slider: slider}
          dataType: 'json'
