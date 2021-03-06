$(function() {

  var $controlPanel = $('.control-panel');

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
      dock: {
        dockToElement: true,
        docked: true
        // dockToScreen: false,
      },
      embed: false,
      floatLeft: false,
      floatNone: false,
      floatRight: false,
      fontFamilyMenu: false,
      guides: false,
      // historyRedo
      // historyUndo
      hrCreate: false,
      insertFile: false,
      languageMenu: false,
      linkCreate: false,
      linkRemove: false,
      listOrdered: false,
      listUnordered: false,
      logo: false,
      save: {
        plugin: 'saveRest'
      },
      saveRest: {
        url: '/cms/content',
        data: function(html) {
          return {
            'authenticity_token': $('meta[name="csrf-token"]').attr('content'),
            slug: this.raptor.getElement().data('copilotSlug'),
            value: html
          };
        }
      },
      snippetMenu: false,
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
      viewSource: false
    }
  });

  $('[content-editable]').each(function(i, el){
    $(el).on('click', function(){
      Raptor.getInstances()[i].enableEditing();
    });
  });

  $('.toggle-control-panel').on('click', function(e){
    e.preventDefault();
    var expanded = $(this).data('expanded');
    if (expanded){
      $(this).text('+');
      $controlPanel.hide();
    } else {
      $(this).text('-');
      $controlPanel.show();
    }
    $(this).data('expanded', !expanded);
  });

});
