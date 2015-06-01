* Creates a link with a fully qualified url 
* Usage:
* <table>
* <% SELECT Customers
*    SCAN %>
* <tr><td><<Linkto( oDispatchContext,"/customer/edit/"+customer.id,customer.name)>></td></tr>
* <% ENDSCAN %>
* </table>
PARAMETERS newControllerPath, linkDisplay
RETURN [<a href="]+fullurl(newControllerPath)+[">]+linkDisplay+[</a>]
