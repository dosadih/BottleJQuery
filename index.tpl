 <!--  A simple application that shows how Bottle and jQuery get along.

    :copyright: (c) 2015 by Oz Nahum Tiram.
    :license: BSD, see LICENSE for more details.
    
    Inspired by the same example given in Flask
    :copyright: (c) 2015 by Armin Ronacher.
-->
<!doctype html>
<html>
    <head>
        <title>jQuery Example</title>
        <script type="text/javascript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
        <script type="text/javascript">
          var $SCRIPT_ROOT = "{{ request.script_name }}";
        </script>
        
        <script type="text/javascript">
          $(function() {
            var submit_form = function(e) {
              $.getJSON($SCRIPT_ROOT + '_add_numbers', {
                a: $('input[name="a"]').val(),
                b: $('input[name="b"]').val()
              }, function(data) {
                $('#result').text(data.result);
                $('input[name=a]').focus().select();
              });
              return false;
            };
            
            <!-- Submit key by clicking the link-->
            $('a#calculate').bind('click', submit_form);
            
            <!-- Submit data with return key   -->
            $('input[type=text]').bind('keydown', function(e) {
              if (e.keyCode == 13) {
                submit_form(e);
              }
            });
        
            $('input[name=a]').focus();
          });
        </script>
    </head>
    <body>
        <h1>jQuery Example</h1>
        <p>
          <input type="text" size="5" name="a"> +
          <input type="text" size="5" name="b"> =
          <span id="result">?</span>
        <p><a href=# id="calculate">calculate server side</a>
    </body>

</html>
