$(document).on 'turbolinks:load', ->
  name = $('table tr:last-child td input').attr('name')
  playerIndex = 0
  if name
    num = name.match(/(\d)+/)[0]
    console.log 'num=' + num
    lastRowIndex = parseInt(num)
    if playerIndex < lastRowIndex
      playerIndex = lastRowIndex
    console.log 'playerIndex=' + playerIndex
    idv = ''
    $('.btn-default').click ->
      # alert( "Handler for .click() called." )
      $(this).parent().parent().remove()
      updateNoOfPlayers false
      return
  $('#addplayer1').click ->
    #alert( "Handler for .click() called." )
    deletebutton = ' <button type="button" class="btn btn-default btn-sm">' + '<span class="glyphicon glyphicon-remove"></span>' + '</button> '
    input1 =   '<td>'+deletebutton+'<input type="text"  name="players[' + playerIndex + 1 + '][name]" id="players_' + playerIndex + 1 + '_name"></td>'
    input2 = '<td><input type="text"  name="players[' + playerIndex + 1 + '][rating]" id="players_' + playerIndex + 1 + '_rating"></td>'
    $('#playertable tr:last').after '<tr>' + input1 + input2 + '</tr>'
    playerIndex = playerIndex + 1
    updateNoOfPlayers true
    return
  return
 updateNoOfPlayers = (increase=true) ->
  #alert( "updateNoOfPlayers called."+increase )
  nov=$('#playerslength').text()
  noi=parseInt(nov)
  if increase
   noi=noi+1
  else
   noi=noi-1
  $('#playerslength').text("#{noi}")

# ---
# generated by js2coffee 2.2.0