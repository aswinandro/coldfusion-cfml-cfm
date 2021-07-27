

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../style/headfoot.css">
    <link rel="stylesheet" href="../style/styles.css">
</head>
<header class="head-sim">
    <cfinclude template="header.html">
</header>
<body class="whole">
    <cfoutput>
        #form.value#
        <cfset x = #form.value#>
         <cfswitch expression="#x#">
             <cfcase value="1">Okay</cfcase>
             <cfcase value="2">Okay</cfcase>
             <cfcase value="3">Fair</cfcase>
             <cfcase value="4">Good</cfcase>
             <cfcase value="5">Very Good</cfcase>
             <cfdefaultcase>Sorry No Proper Input</cfdefaultcase>
         </cfswitch>
        #value# 
    </cfoutput>
</body>
<footer>
    <cfinclude template="footer.html">
</footer>
</html>