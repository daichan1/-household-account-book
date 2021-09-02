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

  //　バリデーション
  $("#newText").on("input", function() {
    const newText = $("#newText").val()
    if(newText == "") {
      $("#newSubmit").prop("disabled", true)
    } else {
      $("#newSubmit").prop("disabled", false)
    }
  })

  $("input[id^=editText]").on("input", function() {
    const editText = $(this).val()
    const id = $(this).attr("id").replace(/[^0-9]/g, '')
    if(editText == "") {
      $(`#editSubmit${id}`).prop("disabled", true)
    } else {
      $(`#editSubmit${id}`).prop("disabled", false)
    }
  })
})