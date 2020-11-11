Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration.ConfigurationManager
Module connection
    Public cn As SqlConnection
    Public cmd As SqlCommand
    Sub GetConn(strCn As String)
        Dim strSQL As String
        cn = New SqlConnection
        If strCn = "p" Then
            strSQL = ConfigurationManager.ConnectionStrings("people").ToString
        Else
            strSQL = ConfigurationManager.ConnectionStrings("cs").ToString
        End If

        cn.ConnectionString = strSQL
        If cn.State = ConnectionState.Closed Then cn.Open()
    End Sub

End Module
