jQuery ->
  $('.vote').click ->
    idArray = $(this).html().split(':')
    objectType = idArray[0].replace(/^\s+/g, "")
    objectId = idArray[1]
    $.get '/', (data) ->
      votesId = "##{objectType}_#{objectId}_votes"
      voteCount = 1 + +$(votesId).html()
      $(votesId).html(voteCount)
      alert($(this).classes())
    