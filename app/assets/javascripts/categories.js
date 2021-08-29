$(function(){
  $("#newButton").click(function(){
    $("#newCategory").toggleClass("d-none")
  })
  $("#newCancel").click(function(){
    $("#newCategory").toggleClass("d-none")
  })

  function displayToggleCategory(num) {
    return function() {
      $(`#editCategory${num}`).toggleClass("d-none")
    }
  }

  const editButtonCount = $("button[id^=editButton]").length
  for(i = 1; i <= editButtonCount; i++) {
    const f = displayToggleCategory(i)
    $(`#editButton${i}`).click(f)
    $(`#editCancel${i}`).click(f)
  }
})