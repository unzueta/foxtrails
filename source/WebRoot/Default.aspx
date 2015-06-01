<%@ Page Language="VB" AutoEventWireup="false" validateRequest="false" ASPCompat="true"%>

<%
    ' Enabling page expiration can help improve performance
    'Response.CacheControl = "private"
    'Response.Expires = -1
    'Response.AddHeader("Pragma", "private")
    
    Dim dispatcher As New demo.Dispatcher

    ' Turn autocompile off for deployment
    dispatcher.AUTOCOMPILE = True
    dispatcher.LUSECACHE = True
    Response.Write(dispatcher.DispatchRequest(Request.Url.AbsoluteUri, Request.FilePath))
%>
