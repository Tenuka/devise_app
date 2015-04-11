$ ->
  # enable chosen js
  $('.chosen-select').chosen
    allow_single_deselect: true
    no_results_text: 'No results matched'
    width: '360px'
    height: '34px'

  $(".markdown-content").markdown({autofocus:false,savable:false})
