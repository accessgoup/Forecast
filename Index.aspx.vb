Imports System.Data
Imports System.Data.SqlClient
Public Class Index
    Inherits System.Web.UI.Page



    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub btnLogin_Click(sender As Object, e As EventArgs) Handles btnLogin.Click
        If Me.emailaddress.Text.ToLower = "brain" And Me.password.Text.ToLower = "brain" Then
            Dim newLoginCookie = New HttpCookie("Login")
            newLoginCookie.Value = "brain"
            newLoginCookie.Expires = DateTime.Now.AddHours(1)

            Me.Response.Cookies.Add(newLoginCookie)
            Response.Redirect("Ordini.aspx")
        Else
            Me.emailaddress.Text = ""
            Me.password.Text = ""


        End If
    End Sub
End Class