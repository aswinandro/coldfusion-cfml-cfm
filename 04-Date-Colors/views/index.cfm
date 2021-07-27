

<cfset dtThisMonth = now() />
<cfset dtnow= (dateFormat(dtThisMonth, 'd'))>

<cfset dtMonthStart = (dtThisMonth + 1 - DayOfWeek( dtThisMonth )) />


<cfset dtMonthEnd = (dtThisMonth - 1 + DaysInMonth( dtThisMonth )) />
<cfset dtMonthEnd = (dtMonthEnd + (7 - DayOfWeek( dtMonthEnd ))) />

<cfset dtLastFive = (dtnow- 5)>

<cfset dtLastFiveDays = (dateDiff( 'd',dtLastFive, dtnow))>


<cfset objEvents = StructNew() />



<cfoutput>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>Calendar Month</title>
	<style type="text/css">
		body,
		td {
			font: 13px verdana ;
			}
		
            table.color {
            background-color: rgba(242, 239, 243, 0.946);
            }
            td.cellsun{
             background-color: rgb(255, 128, 128);
           }
           td.cellmon{
             background-color: green;
           }
           td.celltue{
             background-color: orange
           }
           td.cellwed{
             background-color: yellow
           }
           td.cellthu{
             background-color: grey;
           }
           td.cellfri{
             background-color: blue;
           }
           td.cellsat{
             background-color: red;
           }
	</style>
    <link rel="stylesheet" href="../style/styles.css">
</head>
<body>

    <br>

	<h3>
		#DateFormat( dtThisMonth, "mmmm yyyy dddd" )#
	</h3>

	
    <cfoutput>
        <br>
        Todays Date in Numeric 
        <cfset date = now()>
        <cfscript>
            writeOutput(dateFormat( now(), 'mm-dd-yy'))
        </cfscript>
       <br>
       Current Month is
        <cfset date = now()>
        <cfscript>
            writeOutput(dateFormat( now(), 'mmmm'))
        </cfscript>
        <br>
       Last day of Month is
        <cfset today = now()>
        <cfset firstOfThisMonth = createDate(year(today), month(today), 1)>
        <cfset lastOfNextMonth = dateAdd("d", -1, dateAdd("m", 1, firstOfThisMonth))>
        <cfscript>
            
                writeOutput(dateFormat( lastOfNextMonth, 'dd-dddd'))
                
        </cfscript>
        <br>

       <cfset today=dayofweek(now())>
       <span>Last Friday is:</span>
        <cfif today eq 7>
           <span>#dateformat(dateAdd("d",-1,now()))#</span>
        <cfelse>
           <span>#dateformat(dateAdd ("d",-(1+today),now()))#</span>
        </cfif>

    <br>
    <br>
    </cfoutput>

    <br>
    
    <cfoutput>No of Days to be Reversed #dtLastFiveDays# <br></cfoutput>
    <cfoutput>Todays Date #dtnow# <br></cfoutput>
    <cfoutput>Decrement to Previous Date #dtLastFive# <br> <br> </cfoutput>

    
  
    
    <table style= "width: 20%">
    
        <cfloop
			index="intDate"
			from="#dtLastFive#"
			to="#dtnow#"
			step="1">

            <td>
              <tr>
                <cfif StructKeyExists( objEvents, intDate )>
                    <cfset strClass = (strClass & " event") />
                </cfif>
    
                <td>
                    <!--- #Day( intDate )# --->
                    <cfscript>
                        newdate = now();
                        x = newdate.setDay(intDate)
                        y = dateFormat(x, 'dddd')
                        z = dateFormat(x, 'dd-mmm-yyyy')
                        // writeOutput(y)
                        // writeOutput(z)
                    </cfscript>
                    <cfif y eq "Sunday">
                        <tr>
                          <td>
                           <cfoutput>#z#</cfoutput>
                          </td>
                          <td class='cellsun'>
                          <cfoutput>#y#</cfoutput>
                          </td>
                        </tr>
                    <cfelseif y eq "Monday">
                        <tr>
                            <td>
                             <cfoutput>#z#</cfoutput>
                            </td>
                            <td class='cellmon'>
                            <cfoutput>#y#</cfoutput>
                            </td>
                          </tr>
                     <cfelseif y eq "Tuesday">
                        <tr>
                            <td>
                             <cfoutput>#z#</cfoutput>
                            </td>
                            <td class='celltue'>
                            <cfoutput>#y#</cfoutput>
                            </td>
                          </tr>
                      <cfelseif y eq "Wednesday">
                        <tr>
                            <td>
                             <cfoutput>#z#</cfoutput>
                            </td>
                            <td class='cellwed'>
                            <cfoutput>#y#</cfoutput>
                            </td>
                          </tr>
                      <cfelseif y eq "Thursday">
                        <tr>
                            <td>
                             <cfoutput>#z#</cfoutput>
                            </td>
                            <td class='cellthu'>
                            <cfoutput>#y#</cfoutput>
                            </td>
                          </tr>
                      <cfelseif y eq "Friday">
                        <tr>
                            <td>
                             <cfoutput>#z#</cfoutput>
                            </td>
                            <td class='cellfri'>
                            <cfoutput>#y#</cfoutput>
                            </td>
                          </tr>
                      <cfelseif y eq "Saturday">
                        <tr>
                            <td>
                             <cfoutput>#z#</cfoutput>
                            </td>
                            <td class='cellsat'>
                            <cfoutput>#y#</cfoutput>
                            </td>
                          </tr>
                     <cfelse>
                        <cfoutput>#y#</cfoutput>
                    </cfif>
                </td>
                </tr>   
            </td>
       </cfloop>

    
            

</table>
    

</body>
</html>
</cfoutput>