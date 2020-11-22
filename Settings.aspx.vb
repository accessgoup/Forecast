
Imports System.Data
Public Class Settings
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Load_xml()
    End Sub
    Protected Sub Load_xml()
        Dim ds As DataSet = New DataSet
        ds.ReadXml(Server.MapPath("~/App_Data/DefaultParameters.xml"))
        GridParameters.DataSource = ds
        GridParameters.DataBind()

    End Sub

End Class