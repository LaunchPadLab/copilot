$(function() {
  // $(".copilot-editable").blur(function() {
  //   var t = $(this);
  //   var slug = t.data().copilotSlug;
  //   var origValue = t.data().copilotValue;
  //   var curValue = t.text();

  //   if (origValue != curValue) {
  //     $.ajax({
  //       url: '/copilot/content',
  //       beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
  //       type: 'PATCH',
  //       data: {slug: slug, value: curValue}
  //     });
  //   }
  // });
  $('#raptor-docked-element').raptor({
    autoEnable: true
  });

});
