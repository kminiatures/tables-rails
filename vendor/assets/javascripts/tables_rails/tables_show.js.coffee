$ ->
  class Sql
    constructor: () ->
      codemirror_opt = {
        theme: 'night',
        lineNumbers: true,
        mode: "text/x-mysql",
        matchBrackets: true,
        lineWrapping: true,
        extraKeys: {
          "Tab": false,      # Let focus go to next control
          #"Shift-Tab": false # Let focus go to previous control
        }
      }

      @sql_editor = CodeMirror.fromTextArea $('textarea#sql')[0], codemirror_opt

      @where_editor = CodeMirror.fromTextArea $('#where')[0], $.extend({}, codemirror_opt, {
        onKeyEvent: (editor, event)=>
          if event.type == "keypress"
            console.log event.type
            @set_sql()
      })

      $('table.columns').delegate 'input[type="checkbox"]', 'click', =>
        @set_sql()

      $('#result').delegate '#close-result-button', 'click', =>
        $('#result').fadeOut('first')

      $('#smallize-column-button').click =>
        console.log 'small'
        $('#result table.result').removeClass 'all-open'

      $('#open-column-button').click =>
        console.log 'open'
        $('#result table.result').addClass 'all-open'

      $('button.call-sql-button').click =>
        data = {sql: @sql_editor.getValue()}
        $.ajax
          type: 'POST'
          url: 'result'
          data: data
          success: (data)->
            $('div#result').html(data).fadeIn()
          dataType: 'html'

      $('div#logs').delegate 'td.sql', 'click', (e)=>
        @set_sql $(e.target).text()


      @set_sql()
      @logs()

    set_sql: (val = '')->
      @sql_editor.setValue(if val != '' then val else @build())

    # paste_sql: ->
      # @set_sq

    logs: ->
      console.log 'call logs'
      data = {}
      $.ajax
        type: 'GET'
        url: '../logs'
        data: data
        success: (data)->
          $('div#logs').html(data).fadeIn()
        dataType: 'html'

    build: ->
      col_arr = []
      for checked in $('table.columns input[type="checkbox"]:checked') then do (checked) =>
        col_arr.push $(checked).val()
      if col_arr.length == 0
        columns = '*'
      else
        columns = col_arr.join(", ")

      table_name = $('#table-name').text()
      where      = $.trim @where_editor.getValue()
      order      = $('#order').text()
      limit      = $('#limit').text()
      condition = if where == '' then '' else "WHERE #{where}\n"

      "SELECT\n    #{columns}\n" +
      "FROM #{table_name}\n" +
      condition +
      "ORDER BY #{order}\n" +
      "LIMIT #{limit}"


  sql = new Sql()

