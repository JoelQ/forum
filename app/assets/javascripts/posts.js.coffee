$ ->
  $('body').on 'ajax:success', 'a.edit-post', (e, data)->
    $(e.target).parent().html(data)
