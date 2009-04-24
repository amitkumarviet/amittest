Imports System
Imports System.Data
Imports System.XML
Imports System.Web
Imports System.Globalization
Imports Microsoft.VisualBasic
Imports System.Collections.Generic
Imports System.Text
Imports System.Configuration
Imports System.Collections.Specialized
Imports System.ComponentModel
'Imports EventCalendarWebserviceComponent


Partial Class Gadget2_Events
    Inherits System.Web.UI.Page

    Private _dsEvents As New DataSet
    Private _StartDate As New DateTime
    Private _EndDate As New DateTime

    Dim ModuleId As Integer

    ' public properties
    Public Property StartDate() As DateTime
        Get
            Return _StartDate
        End Get
        Set(ByVal Value As DateTime)
            _StartDate = Value
        End Set
    End Property

    ' public properties
    Public Property EndDate() As DateTime
        Get
            Return _EndDate
        End Get
        Set(ByVal Value As DateTime)
            _EndDate = Value
        End Set
    End Property

    ' public properties
    Public Property dsEventsList() As DataSet
        Get
            Return _dsEvents
        End Get
        Set(ByVal Value As DataSet)
            _dsEvents = Value
        End Set
    End Property
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            ModuleId = 763

            'Dim wsEventMgmt As New EventBusinessLayer
            Dim wsEventMgmt As New com.exploreboonearea.dev.EventMgmt

            If Request.QueryString("StartDate") Is Nothing Then
                StartDate = DateTime.Now.Date.ToString("MM/dd/yyyy")
                EndDate = DateTime.Now.Date.AddDays(365).Date.ToString("MM/dd/yyyy")
            Else
                If Request.QueryString("StartDate") = "" Or Request.QueryString("EndDate") = "" Then
                    Response.Clear()
                    Response.Write("Event not Found.")
                    Response.End()
                    Exit Sub
                Else
                    StartDate = CDate(Request.QueryString("StartDate"))
                    EndDate = CDate(Request.QueryString("EndDate"))
                End If
            End If

            If Request.QueryString("VenueId") = "0" And Request.QueryString("CategoryId") = "0" Then
                'Dim objEventBusinessLayer As New EventBusinessLayer()
                'dsEventsList = objEventBusinessLayer.GetEventsByDateRange(ModuleId, StartDate, EndDate)

                dsEventsList = wsEventMgmt.GetEventsByDateRange(ModuleId, StartDate, EndDate)
            ElseIf Request.QueryString("VenueId") = "0" And Request.QueryString("CategoryId") <> "0" Then
                dsEventsList = wsEventMgmt.GetEventsByDateRangeCategoryWise(ModuleId, StartDate, EndDate, Request.QueryString("CategoryId"))
            ElseIf Request.QueryString("VenueId") <> "0" And Request.QueryString("CategoryId") = "0" Then
                dsEventsList = wsEventMgmt.GetEventsByDateRangeVenueWise(ModuleId, StartDate, EndDate, Request.QueryString("VenueId"))
            ElseIf Request.QueryString("VenueId") <> "0" And Request.QueryString("CategoryId") <> "0" Then
                dsEventsList = wsEventMgmt.GetEventsByDateRangeCategoryVenueWise(ModuleId, StartDate, EndDate, Request.QueryString("VenueId"), Request.QueryString("CategoryId"))
            End If

            Dim str As New StringBuilder
            If dsEventsList.Tables(0).Rows.Count > 0 Then
                For Each dr As DataRow In dsEventsList.Tables(0).Rows
                    str.Append("<hr style='height: 1px' />")
                    str.Append("<b>" + dr("Title").ToString().ToUpper() + "</b>")
                    str.Append("<br />")
                    str.Append(DateTime.Parse(dr("StartDate").ToString()).ToString("dd MMM yyyy (hh:mm tt)"))
                    str.Append("<br />")
                    str.Append("<span style='color: #0099ff'>Showing events until " + DateTime.Parse(dr("EndTime").ToString()).ToString("dd MMM yyyy (hh:mm tt)"))
                    str.Append("</span><br />")

                    If dr("EventInfoText").ToString() <> "" Then
                        str.Append("<span style='color: red'>" + dr("EventInfoText").ToString())
                        str.Append("</span><br />")
                    End If
                    'str.Append("<a href='#'>Look for more</a></span>")
                Next
            Else
                str.Append("<hr style='height: 1px' />")
                str.Append("<br />")
                str.Append("No data found")
                str.Append("<br /><br />")
                str.Append("<hr style='height: 1px' />")
            End If



            Response.Write(str.ToString)
            Response.End()
        End If


    End Sub
End Class

