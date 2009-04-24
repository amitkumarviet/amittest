
Partial Class Gadget2_Home
    Inherits System.Web.UI.Page

    Public isSlideShow As String
    Public setSlideShow As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Request.QueryString("isSlideShow") Is Nothing Then isSlideShow = Request.QueryString("isSlideShow")
        If Not Request.QueryString("setSlideShow") Is Nothing Then setSlideShow = Request.QueryString("setSlideShow")
    End Sub
End Class
