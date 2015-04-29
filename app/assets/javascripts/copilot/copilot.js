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

  $('[content-editable]').raptor({
    plugins:{
      alignCenter: false,
      alignJustify: false,
      alignLeft: false,
      alignRight: false,
      // cancel
      classMenu: false,
      clearFormatting: false,
      clickButtonToEdit: false,
      colorMenuBasic: false,
      dockToElement: false,
      dockToScreen: false,
      // embed
      floatLeft: false,
      floatNone: false,
      floatRight: false,
      fontFamilyMenu: false,
      guides: false,
      // historyRedo
      // historyUndo
      hrCreate: false,
      // insertFile
      languageMenu: false,
      // linkCreate
      // linkRemove
      // listOrdered
      // listUnordered
      logo: false,
      // save
      // snippetMenu
      specialCharacters: false,
      statistics: false,
      tableCreate: false,
      tableDeleteColumn: false,
      tableDeleteRow: false,
      tableInsertColumn: false,
      tableInsertRow: false,
      tableMergeCells: false,
      tableSplitCells: false,
      tagMenu: false,
      textBlockQuote: false,
      textBold: false,
      textItalic: false,
      textSizeDecrease: false,
      textSizeIncrease: false,
      textStrike: false,
      textSub: false,
      textSuper: false,
      textUnderline: false,
      // viewSource
      dock:{
        docked:true
      }
    }
  });

  $('[content-editable]').each(function(i, el){
    $(el).on('click', function(){
      Raptor.getInstances()[i].enableEditing();
    });
  });

});
