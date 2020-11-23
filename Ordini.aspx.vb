Imports System.Data.SqlClient


Public Class Ordini
    Inherits System.Web.UI.Page
    Dim ds As New DataSet()
    Dim bGrid As Boolean

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim request = Me.Request
        Dim loginCookie = request.Cookies("Login")

        If loginCookie Is Nothing Then
            Response.Redirect("Index.aspx")
        End If

        If Not IsPostBack() Then
            SetParameters()
            FillDropClienti()
            LoadKPI()
        End If
        ListCustomerBonus()
        bGrid = False

    End Sub

    Sub SetParameters()

        Me.Inizio.Text = "2020-01-01"
        Me.Fine.Text = DateTime.Now.ToString("yyyy-MM-dd")
        Me.RankOrdine.Text = 5000
        Me.StepOrdine.Text = 5
        Me.RankAgente.Text = 500
        Me.stepAgente.Text = 10
        Me.txtLimitRows.Text = 100
    End Sub


    Sub LoadData(t As Integer)

        Dim adp As New SqlDataAdapter()
        Dim dt As DataTable = New DataTable

        Try

            GetConn("cs")

            cmd = New SqlCommand("forecast_RankOrdini_v3", cn)

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.Clear()
            cmd.Parameters.Add("@top", SqlDbType.VarChar).Value = Me.txtLimitRows.Text
            cmd.Parameters.Add("@Tipo", SqlDbType.Int).Value = t

            cmd.Parameters.Add("@Dal", SqlDbType.Date).Value = Me.Inizio.Text
            cmd.Parameters.Add("@Al", SqlDbType.Date).Value = Me.Fine.Text

            cmd.Parameters.Add("@TotRankValore", SqlDbType.Int).Value = Me.RankOrdine.Text
            cmd.Parameters.Add("@StepRankValore", SqlDbType.Int).Value = Me.StepOrdine.Text
            cmd.Parameters.Add("@filter", SqlDbType.NVarChar).Value = Me.txtFilter.Text

            'cmd.Parameters.AddWithValue("@TotRankAgente", Me.RankAgente.Text)
            'cmd.Parameters.AddWithValue("@StepRankAgente", Me.stepAgente.Text)


            adp.SelectCommand = cmd
            If t = 1 Then
                cmd.ExecuteNonQuery()
            Else
                adp.Fill(dt)
            End If

            cn.Close()

                With Me.GridOrdini
                'If Not String.IsNullOrEmpty(Me.txtFilter.Text) Then
                'dt.DefaultView.RowFilter = String.Format("Cliente LIKE '%{0}%' OR CodiceCliente LIKE '%{0}%'", Me.txtFilter.Text)
                'End If
                If String.IsNullOrEmpty(Session("TaskTable")) Then Session("TaskTable") = "CLIENTE"

                    dt.DefaultView.Sort = Session("TaskTable")

                    If dt.Rows.Count > 0 Then
                        Dim s As Object
                        s = dt.Compute("SUM(ValorePreventiviPeriodo)", String.Empty)
                        litValorePreventivo.Text = String.Format(Globalization.CultureInfo.CurrentCulture, "{0:C2}", s)
                        s = dt.Compute("SUM(ValorePreventiviPeriodoAnnoPrec)", String.Empty)
                        litValorePreventivoAnnoPrec.Text = "ANNO PRECEDENTE " + String.Format(Globalization.CultureInfo.CurrentCulture, "{0:C2}", s)

                        s = dt.Compute("SUM(RichiestePeriodo)", String.Empty)
                        litRichiestePeriodo.Text = s.ToString
                        s = dt.Compute("SUM(RighePreventiviPeriodo)", String.Empty)
                        LitNumeroPreventivi.Text = "TOTALE RIGHE PREVENTIVI " + s.ToString

                        s = dt.Compute("SUM(ImportoOrdinatoPeriodo)", String.Empty)
                        Me.LitOrdiniPeriodo.Text = String.Format(Globalization.CultureInfo.CurrentCulture, "{0:C2}", s)
                        s = dt.Compute("SUM(ImportoOrdinato)", String.Empty)
                        LitOrdini.Text = "TOTALE ORDINATO " + String.Format(Globalization.CultureInfo.CurrentCulture, "{0:C2}", s)

                        s = dt.Compute("AVG(MediaTassoConversionePeriodo)", String.Empty)
                        LitMediaConversionePeriodo.Text = String.Format("{0:0.00}", s) + "%"
                        s = dt.Compute("AVG(MediaTassoConversione)", String.Empty)
                        LitMediaConversione.Text = "MEDA TASSO CONVERSIONE " + String.Format("{0:0.00}", s) + "%"


                        Me.GridOrdini.DataSource = dt
                        Me.GridOrdini.DataBind()
                    Else

                    End If
                End With

        Catch ex As Exception
                MsgBox(ex.Message.ToString)
                'Response.Write("Oops!! following error occured: " + ex.Message.ToString)
            Finally
                ds.Clear()
            ds.Dispose()
            adp.Dispose()
        End Try

    End Sub

    Sub LoadKPI()
        Dim adp As New SqlDataAdapter()
        Dim dt As DataTable = New DataTable

        Try

            GetConn("cs")

            cmd = New SqlCommand("Forecast_KPI", cn)

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.Clear()
            cmd.Parameters.Add("@Tipo", SqlDbType.Int).Value = 1

            cmd.Parameters.Add("@Inizio", SqlDbType.Date).Value = Me.Inizio.Text
            cmd.Parameters.Add("@Fine", SqlDbType.Date).Value = Me.Fine.Text

            adp.SelectCommand = cmd

            adp.Fill(dt)

            cn.Close()

            With Me.RepKPI
                If dt.Rows.Count > 0 Then

                    Me.RepKPI.DataSource = dt
                    Me.RepKPI.DataBind()
                Else

                End If
            End With

        Catch ex As Exception
            strerror = ex.Message.ToString
            Response.Redirect("Oops.aspx")
            'MsgBox(ex.Message.ToString)
            'Response.Write("Oops!! following error occured: " + ex.Message.ToString)
        Finally
            ds.Clear()
            ds.Dispose()
            adp.Dispose()
        End Try

    End Sub


    Protected Sub btnExec_Click(sender As Object, e As EventArgs)
        If sender.TEXT = "RIELABORA" Then
            LoadData(0)
        Else
            LoadData(1)
        End If
    End Sub

    Sub FillDropClienti()
        Dim adp As New SqlDataAdapter()
        Dim dt As DataSet = New DataSet

        GetConn("cs")

        cmd = New SqlCommand("SELECT cd_cf, Descrizione FROM cf WHERE Cliente = 1 ORDER BY Descrizione", cn)



        adp.SelectCommand = cmd
        adp.Fill(dt)
        cn.Close()
        If dt.Tables(0).Rows.Count > 0 Then
            With Me.ddCustomerList

                .DataSource = dt.Tables(0)
                .DataTextField = dt.Tables(0).Columns("Descrizione").ToString
                .DataValueField = dt.Tables(0).Columns("cd_cf").ToString

                .DataBind()
                .Items.Insert(0, New ListItem("", ""))
            End With
        End If
    End Sub
    Sub ListCustomerBonus()

        Dim adp As New SqlDataAdapter()
        Dim dt As DataSet = New DataSet

        GetConn("cs")

        cmd = New SqlCommand("SELECT PeopleID ID,Custom06 Bonus, cf.Cd_CF, cf.Descrizione As Cliente,  convert(varchar, Custom07, 3) Da,  convert(varchar, Custom08, 3)  A FROM [PDB_FITAVATRADING].[dbo].[PeopleCustomFields] Pf INNER JOIN [PDB_FITAVATRADING].[dbo].[People] P ON pf.PeopleID=p.ID INNER JOIN ADB_FITAVATRADING.dbo.cf ON p.Code = cf.Cd_CF WHERE Custom06<>'' ORDER BY CONVERT(int, Custom06) DESC", cn)

        adp.SelectCommand = cmd
        adp.Fill(dt)
        cn.Close()
        If dt.Tables(0).Rows.Count > 0 Then
            Me.GridClienti.DataSource = dt
            Me.GridClienti.DataBind()
        End If
    End Sub




    Protected Sub GridOrdini_PageIndexChanging(sender As Object, e As GridViewPageEventArgs)
        GridOrdini.PageIndex = e.NewPageIndex
        LoadData(0)
    End Sub

    'Private Sub RepBonus_ItemCommand(source As Object, e As RepeaterCommandEventArgs) Handles RepBonus.ItemCommand
    '    If e.CommandName = "Delete" Then

    '        GetConn("p")

    '        cmd = New SqlCommand("UPDATE [PDB_FITAVATRADING].[dbo].[PeopleCustomFields] SET Custom06='' WHERE Peopleid=@id", cn)
    '        cmd.Parameters.AddWithValue("id", e.CommandArgument)
    '        cmd.ExecuteNonQuery()
    '        RepBonus.DataBind()
    '        'ListCustomerBonus()

    '    End If
    'End Sub

    Protected Sub btnUpdate_Click(sender As Object, e As EventArgs)
        If Me.txtBonus.Text <> "" And Me.ddCustomerList.SelectedItem.Value <> "" Then

            GetConn("p")

            cmd = New SqlCommand("UPDATE PeopleCustomFields SET Custom06=@bonus,Custom07=@Da, Custom08=@A WHERE PeopleID=(SELECT ID FROM People WHERE Code=@code)", cn)
            cmd.Parameters.AddWithValue("bonus", Me.txtBonus.Text)
            cmd.Parameters.AddWithValue("Code", Me.ddCustomerList.SelectedItem.Value)
            cmd.Parameters.AddWithValue("Da", Me.txtDa.Text)
            cmd.Parameters.AddWithValue("A", Me.txtA.Text)

            cmd.ExecuteNonQuery()
            ListCustomerBonus()
            Me.txtBonus.Text = ""
            Me.ddCustomerList.Text = ""
        End If
    End Sub



    Protected Sub TaskGridView_Sorting(ByVal sender As Object, ByVal e As GridViewSortEventArgs)
        Session("TaskTable") = e.SortExpression
        LoadData(0)
    End Sub


    Sub ShowGrid(sender As Object, e As EventArgs) Handles btnShowClienti.Click, btnExec.Click
        bGrid = (sender.id = "btnExec")
        Me.GridOrdini.Visible = bGrid
        Me.GridClienti.Visible = Not bGrid
    End Sub

    Private Sub GridClienti_PageIndexChanging(sender As Object, e As GridViewPageEventArgs) Handles GridClienti.PageIndexChanging
        GridClienti.PageIndex = e.NewPageIndex
        ListCustomerBonus()
    End Sub
End Class