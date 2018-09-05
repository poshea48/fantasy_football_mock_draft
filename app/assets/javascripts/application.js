// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

$(document).ready(function() {
  $('#pick_number').on("change", "select", function(e) {
    e.preventDefault();
    $.ajax({
      url: '/players/update_pick_number',
      method: 'get',
      data: "pick_number=" + e.target.value,
      success: function() {
        console.log("Maybe this worked")
      }
    });
  });

  // $("table").on("click", ".strikeout_player", function(e) {
  //   e.preventDefault()
  //   let $tr = $(this).parents("tr")
  //   let id = $tr.data().id
  //   $.ajax({
  //     url: `/players/${id}`,
  //     method: 'patch',
  //     success: function(res) {
  //       $tr.addClass("strikeout")
  //       $tr.addClass("table-dark")
  //       $tr.find("input").attr("disabled")
  //     }
  //   })
  // })

  $("div.container").on("click", ".btn", function(e) {
    e.preventDefault()
    let data;
    if ($(this).attr("class").includes("draft_player")) {
      data = {my_player: true}
    }
    let $tr = $(this).parents("tr")
    let id = $tr.data().id
    $.ajax({
      url: `/players/${id}`,
      method: 'patch',
      data: data,
      success: function(res) {
        $tr.addClass("strikeout")
        $tr.addClass("table-dark")
        $tr.find("input").attr("disabled", true)
      }
    })
  })

  // $("table").on("click", ".draft_player", function(e) {
  //   e.preventDefault()
  //   let $tr = $(this).parents("tr")
  //   let id = $tr.data().id
  //   $.ajax({
  //     url: `/players/${id}`,
  //     method: 'patch',
  //     success: function(res) {
  //       $tr.addClass("strikeout")
  //       $tr.addClass("table-dark")
  //       $tr.find("input").attr("disabled")
  //     }
  //   })
  // })
})
