# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  if $('#service_photos #dropzone_photo').length
    dropzone_photo = new Dropzone '#service_photos #dropzone_photo',
      paramName: "service_photo[image]",
      parallelUploads: 2
      maxFilesize: 5
      dictDefaultMessage: '點擊此處以上傳照片(或直接將照片拉到此處)<br><div style="margin:30px"><i class="fa fa-cloud-upload fa-3x"></i></div>'
      dictRemoveFile: '移除檔案'
      dictCancelUpload: '取消上傳'
      dictInvalidFileType: '檔案格式錯誤，請上傳圖片'
      init: (e) ->
        thisDropzone = @
        $.getJSON gon.admin_service_service_photos_path, (service_photo) ->
          $.each service_photo, (key, value) ->
            mockFile = { id: value.id, name: value.name, size: value.size, position: value.position }
            thisDropzone.options.addedfile.call(thisDropzone, mockFile)
            thisDropzone.options.thumbnail.call(thisDropzone, mockFile, value.url)
            thisDropzone.files.push(mockFile)
            $(thisDropzone.files[thisDropzone.files.length-1].previewElement).attr('data-id', value.id)

            dz_remove = $(thisDropzone.files[thisDropzone.files.length-1].previewTemplate).find('.dz-remove')

            dz_show = $('<a/>', {
              href: "#{gon.admin_service_service_photos_path}/#{value.id}/edit"
              class: 'dz-show'
              html: '檢視圖片'
            })

            dz_show.insertBefore(dz_remove)

      success: (file, response) ->
        if response.status == 'success'
          file.id = response.service_photo.id
          file.position = response.position

          dz_remove = $(file.previewTemplate).find('.dz-remove')

          dz_show = $('<a/>', {
            href: "#{gon.admin_service_service_photos_path}/#{response.service_photo.id}/edit"
            class: 'dz-show'
            html: '檢視圖片'
          })
          dz_show.insertBefore(dz_remove)
          return file.previewElement.classList.add("dz-success")
        else
          return file.previewElement.classList.add("dz-error")

      removedfile: (file) ->
        $.ajax
          type: 'DELETE',
          url: "#{gon.admin_service_service_photos_path}/#{file.id}",
          dataType: 'json'

        _ref = undefined
        if (_ref = file.previewElement) != null then _ref.parentNode.removeChild(file.previewElement) else undefined

    $('#service_photos #dropzone_photo').sortable
      items:'.dz-preview',
      cursor: 'move',
      opacity: 0.5,
      containment: "parent",
      distance: 20,
      tolerance: 'pointer',
      update: (e, ui) ->
        service_photo = {}

        $('#dropzone_photo .dz-preview').each (k, v) ->
          id = $(this).data('id')
          service_photo[id] = {position: k + 1}

        $.ajax
          type: 'PUT',
          url: gon.update_position_admin_service_service_photos_path
          data: {service_photo: service_photo}
          dataType: 'json'

  if $('#service_references #dropzone_photo').length
    dropzone_photo = new Dropzone '#service_references #dropzone_photo',
      paramName: "service_reference[image]",
      parallelUploads: 2
      maxFilesize: 5
      dictDefaultMessage: '點擊此處以上傳照片(或直接將照片拉到此處)<br><div style="margin:30px"><i class="fa fa-cloud-upload fa-3x"></i></div>'
      dictRemoveFile: '移除檔案'
      dictCancelUpload: '取消上傳'
      dictInvalidFileType: '檔案格式錯誤，請上傳圖片'
      init: (e) ->
        thisDropzone = @
        $.getJSON gon.admin_service_service_references_path, (service_reference) ->
          $.each service_reference, (key, value) ->
            mockFile = { id: value.id, name: value.name, size: value.size, position: value.position }
            thisDropzone.options.addedfile.call(thisDropzone, mockFile)
            thisDropzone.options.thumbnail.call(thisDropzone, mockFile, value.url)
            thisDropzone.files.push(mockFile)
            $(thisDropzone.files[thisDropzone.files.length-1].previewElement).attr('data-id', value.id)

            dz_remove = $(thisDropzone.files[thisDropzone.files.length-1].previewTemplate).find('.dz-remove')

            dz_show = $('<a/>', {
              href: "#{gon.admin_service_service_references_path}/#{value.id}/edit"
              class: 'dz-show'
              html: '檢視圖片'
            })

            dz_show.insertBefore(dz_remove)

      success: (file, response) ->
        if response.status == 'success'
          file.id = response.service_reference.id
          file.position = response.position

          dz_remove = $(file.previewTemplate).find('.dz-remove')

          dz_show = $('<a/>', {
            href: "#{gon.admin_service_service_references_path}/#{response.service_reference.id}/edit"
            class: 'dz-show'
            html: '檢視圖片'
          })
          dz_show.insertBefore(dz_remove)
          return file.previewElement.classList.add("dz-success")
        else
          return file.previewElement.classList.add("dz-error")

      removedfile: (file) ->
        $.ajax
          type: 'DELETE',
          url: "#{gon.admin_service_service_references_path}/#{file.id}",
          dataType: 'json'

        _ref = undefined
        if (_ref = file.previewElement) != null then _ref.parentNode.removeChild(file.previewElement) else undefined

    $('#service_references #dropzone_photo').sortable
      items:'.dz-preview',
      cursor: 'move',
      opacity: 0.5,
      containment: "parent",
      distance: 20,
      tolerance: 'pointer',
      update: (e, ui) ->
        service_reference = {}

        $('#dropzone_photo .dz-preview').each (k, v) ->
          id = $(this).data('id')
          service_reference[id] = {position: k + 1}

        $.ajax
          type: 'PUT',
          url: gon.update_position_admin_service_service_references_path
          data: {service_reference: service_reference}
          dataType: 'json'
