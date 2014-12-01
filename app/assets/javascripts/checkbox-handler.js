function changeRetiredStatus(event) {
  var value = $(event.target).prop('checked')
  $.ajax({
    url: "/admin/fillings/" + event.target.id,
    type: "put",
    data: { filling: { retired: value } }
  })
}
