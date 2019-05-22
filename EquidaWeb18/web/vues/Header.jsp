<%-- 
    Document   : ClientAjouter
    Created on : 22/06, 16:35:27
    Author     : Zakina
--%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Equida - ${param.NomPage}</title>

    <meta name = "viewport" content = "width = device-width, initial-scale = 1">      
    <link rel = "stylesheet" href = "https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel = "stylesheet" href = "https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <link rel = "stylesheet" href = "<%= request.getContextPath()%>/vues/style.css">

    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script type = "text/javascript" src = "https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src = "https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>	 
    
    
    <!--<script type = "text/javascript" src="https://raw.githubusercontent.com/jquery/jquery-ui/master/ui/i18n/datepicker-fr.js"> </script>-->
    
    <script>
        function getRandomColor() {
   var letters = '0123456789ABCDEF'.split('');
   var color = '#';
   for (var i = 0; i < 6; i++ ) {
       color += letters[Math.floor(Math.random() * 16)];
   }
   return color;
}
    $(document).ready(function () {
            $(".dropdown-trigger").dropdown();
            $('select').formSelect();
            $(".datepicker").datepicker({
                    format : 'yyyy-mm-dd'
                });
            //$(".datepicker").setDefaults( $.datepicker.regional["fr"] );
        
            var Color1 = "#2C842C";
            var Color2 = "#A56937";
            var Color3 = "#FFFFFF";
            var Color4 = "#522601";
            
            $(".nav-wrapper").css("background-color", Color1);
            $(".secondary-content>.material-icons").css("color", Color1);
            $(".btn").css("background-color", Color2);
            $(".btn-small").css("background-color", Color2);
            $("h1").css("color", Color3);
            $("h2").css("color", Color4);
            $("h3").css("color", Color4);
            $(".page-footer").css("background-color", Color1);
            $(".input-field").css("color", Color2);
            $(".input-field>.material-icons").css("color", Color2);
            $(".input-field>label").css("color", Color2);
            $(".btn-floating").css("background-color", Color2);
            $(".dropdown-content>li>a").css("color", Color2);
        });
        
        (function($){
  $(function(){

    $('.sidenav').sidenav();
    $('.parallax').parallax();

  }); // end of document ready
})(jQuery); // end of jQuery name space

    </script>
</head>