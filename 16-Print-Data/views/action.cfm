

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
    <br>

    <cfset cols = 3> 
<cfset totalRows = 3>
<cfset output = 1>
<table width = "50%" border="0" align="center" cellpadding="2" cellspacing= "2">            
<cfloop from = "1" to = "#totalRows#" index = "thisRow">
<cfset x = #form.val#>
<tr>
    <cfloop from = "1" to = "#cols#" index = "thisCol">
        
    <td width = "<cfoutput>#numberformat((100/cols), 99)#</cfoutput>%" align="center" nowrap style = "border: 1px solid #ccc;">
            <cfoutput> 
                
            <div> 
                <font style="font-size: .8em; line-height: .6em; padding-bottom: .8em;"><strong>#output#</strong></font> 
                <cfset x = x+1>
            </div>
         </cfoutput>
        <cfset output = output + totalRows>
        
    </td>
    </cfloop>
    <cfset output = thisRow + 1>
    
</tr>
  
</cfloop>

<cfoutput>Rows Created #totalRows#</cfoutput>
<cfoutput>Colums Created #cols#</cfoutput>

</body>
<footer>
    <cfinclude template="footer.html">
</footer>
</html>