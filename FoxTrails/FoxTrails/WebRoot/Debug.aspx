<%@ Page Language="VB" AutoEventWireup="false" validateRequest="false" ASPCompat="true"%>
<%
    Dim dispatcher As New demo.Dispatcher
    dispatcher.AUTOCOMPILE = True
    dispatcher.LUSECACHE = True
    Response.Write(dispatcher.DebugRequest(Request.Url.AbsoluteUri, Request.FilePath))
%>
