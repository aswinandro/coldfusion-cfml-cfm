<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href = "../style/styles.css">
    <link rel="stylesheet" href = "../style/headfoot.css">
    <title>Coldfusion</title>
</head>
<header class="head-sim">
    <cfinclude template="header.html">
</header>
<body class="whole">
    <cfapplication name="Coldfusion" sessionmanagement="Yes">
    <cfset varibales.cacheScope = "session" /> 
    <cfset variables.cache = " "/>
    <div name="fomee" class="form">
     <cfoutput>
        <div class="form_sub">
            <cfif isDefined("process_it")>
               <!--- keyvalue = {{Key = #form.key#}, {Value = #form.val#}} --->
               
                <cfset session.keyvalue = structNew()>
            <cfscript>

                    // keyvalue = structNew();
                    keyvalue.Key = #form.key#
                    keyvalue.Value = #form.val#
                    writeDump(#keyvalue#);         
            </cfscript>
                <!--- <cfscript>
                //   keyvalue = {{Key = #form.key#}, {Value = #form.val#}}; 
                </cfscript> --->

             <cfelse>
                <cfform action="action.cfm" method="post">
                    <div>
                        Enter Your Value
                    </div>
                    <cfinput id="textin" type="text" name="val" size="10" maxlength="20" required="true" validateat="onSubmit" default="value"> 
                    <!--- <cfparam val = #form.val# default="Value">  --->
                    </cfinput>
                    <div>                  
                        <input type="hidden" name="process_it" value="1">
                        <cfinput default="1" class="btn" type="submit" name="btn-submit" value="Submit" validateat="onSubmit" onclick="validate()"> </cfinput>      
                </cfform>      
          </cfif>            
        </div>
      </cfoutput>
     <!--- <label id="status">
     </label> --->
     <!--- <cfoutput>
         Enter Key Value Pairs and CF Dump will be in the form of Structure
     </cfoutput> --->
    </div>
    <script src="../script/script.js"></script>
    <div>
    <pre>


    </pre>
        <span>
            Write a CF program to print a data by 3 rows and 3 columns like below example.

           <pre>
            1    4    7
            2    5    8
            3    6    9
          </pre>
        </span>
    </div>
</body>
<footer>
    <cfinclude template="footer.html">
</footer>
</html>