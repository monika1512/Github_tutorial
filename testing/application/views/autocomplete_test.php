<html>
<head>
    <link href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.11/jquery-ui.min.js"></script>

    <style>
        .ui-autocomplete { 
            cursor:pointer; 
            height:120px; 
            overflow-y:scroll;
        }    
    </style>
</head>
<body style="font-size:62.5%;">
    <p  style="font:14px arial">Set focus on this box and type some values in it to search!</p>

    <div style="font:14px arial">
        <input type="text" id="tbCountries" />
    </div>
</body>

<script>
    $(document).ready(function() {
        BindControls();
    });

    function BindControls() {
        var Countries = ['ARGENTINA', 
            'AUSTRALIA', 
            'BRAZIL', 
            'BELARUS', 
            'BHUTAN',
            'CHILE', 
            'CAMBODIA', 
            'CANADA', 
            'CHINA', 
            'DENMARK', 
            'DOMINICA'];

        $('#tbCountries').autocomplete({
            source: Countries,
            minLength: 0,
            scroll: true
        }).focus(function() {
            $(this).autocomplete("search", "");
        });
    }
</script>
</html>