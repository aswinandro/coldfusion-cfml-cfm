

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
			font: 11px verdana ;
			}
		table.month {}
		table.month tr.dayheader td {
			background-color: ##8EDB00 ;
			border: 1px solid ##308800 ;
			border-bottom-width: 2px ;
			color: ##E3FB8E ;
			font-weight: bold ;
			padding: 5px 0px 5px 0px ;
			text-align: center ;
			}
		table.month tr.day td {
			background-color: ##E3FB8E ;
			border: 1px solid ##999999 ;
			color: ##308800 ;
			padding: 5px 0px 5px 0px ;
			text-align: center ;
			}
		table.month tr.day td.othermonth {
			background-color: ##F3FDD0 ;
			color: ##999999 ;
			}
		table.month tr.day td.event {
			background-color: ##C8F821 ;
			color: ##666666 ;
			font-weight: bold ;
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

	<h2>
		#DateFormat( dtThisMonth, "mmmm yyyy" )#
	</h2>

	<table width="100%" cellspacing="2" class="month">
	<colgroup>
		<col width="12%" />
		<col width="15%" />
		<col width="15%" />
		<col width="15%" />
		<col width="15%" />
		<col width="15%" />
		<col width="13%" />
	</colgroup>
	<tr class="dayheader">
		<td>
			Sun
		</td>
		<td>
			Mon
		</td>
		<td>
			Tus
		</td>
		<td>
			Wed
		</td>
		<td>
			Thr
		</td>
		<td>
			Fri
		</td>
		<td>
			Sat
		</td>
	</tr>
	<tr class="day">

		<!---
			Now, we need to loop over the days in the
			calendar display month. We can use the start
			and end days we found above. When looping, add
			one to the index. This will add a single day
			per loop iteration.
		--->
		<cfloop
			index="intDate"
			from="#dtMonthStart#"
			to="#dtMonthEnd#"
			step="1">


			<!---
				Check to see which classes we are going to
				need to assign to this day. We are going to
				use one class for month (this vs. other) and
				one for whether or not there is an event.
			--->
			<cfif (Month( intDate ) EQ Month( dtThisMonth))>
				<cfset strClass = "thismonth" />
			<cfelse>
				<cfset strClass = "othermonth" />
			</cfif>

			<!---
				Check to see if there is an event scheduled
				on this day. We can figure this out by checking
				for this date in the event index.
			--->
			<cfif StructKeyExists( objEvents, intDate )>
				<cfset strClass = (strClass & " event") />
			</cfif>

			<td class="#strClass#">
				#Day( intDate )#
			</td>


			<!---
				Check to see if we need to start a new row.
				We will need to do this after every Saturday
				UNLESS we are at the end of our loop.
			--->
			<cfif (
				(DayOfWeek( intDate ) EQ 7) AND
				(intDate LT dtMonthEnd)
				)>
				</tr>
				<tr class="day">
			</cfif>

		</cfloop>
	</tr>
	</table>

    <cfoutput>
        <br>
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
    <cfoutput>Decrement of Previous Dates #dtLastFive# <br> <br> </cfoutput>

    
  
    
    <table style= "width: 40%">
    
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