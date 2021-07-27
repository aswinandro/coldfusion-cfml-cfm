<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href = "../style/styles.css">
    <link rel="stylesheet" href = "../style/headfoot.css">
    <title>Coldfusion 02 Switch</title>
</head>
<header class="head-sim">
    <cfinclude template="header.html">
</header>
<body class="whole">
    <div>
        Enter any Number from 1 - 5
    </div>
    <div class="form">
    <cfform>
        <cfcalendar 
            name = "Coloured Calendar" 
            dayNames = "Sun,Mon,Tue,Wed,Thu,Fri,Sat" 
            disabled = "yes"
            enabled = "no" 
            height = "200px" 
            mask = "character pattern" 
            monthNames = "January, February, March, April, May, June, July, August, September, October, November, December" 
            onBlur = "ActionScript to invoke" 
            onChange = "ActionScript to invoke" 
            onFocus = "ActionScript to invoke" 
            style="halosilver" 
            tooltip = "Coloured Calender" 
            visible = "yes" 
            width = "400px"
        >
    </cfform>
     <pre>

        Show below details in a page

Today's date, current Month in numeric, current month in word, Last friday date, Last day of month
Show Last 5 days date & day like below. 

Sunday should be red, 
Monday - green, 
Tuesday - orange, 
Wednesday - yellow, 
Thursday - bold black, 
Friday - blue, 
Saturday - bold red

02-Dec-2010 - Thursday
01-Dec-2010 - Wednesday
30-Nov-2010 - Tuesday
29-Dec-2010 - Monday
28-Dec-2010 - Sunday
     </pre>
    </div>
    <script src="../script/script.js"></script>
</body>
<footer>
    <cfinclude template="footer.html">
</footer>
</html>