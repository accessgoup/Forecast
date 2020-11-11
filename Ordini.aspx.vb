Imports System.Data.SqlClient


Public Class Ordini
    Inherits System.Web.UI.Page
    Dim ds As New DataSet()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim request = Me.Request
        Dim loginCookie = request.Cookies("Login")

        If loginCookie Is Nothing Then
            Response.Redirect("Index.aspx")
        End If

        If Not IsPostBack() Then
            SetParameters()
            FillDropClienti()

        End If
        ListCustomerBonus()
    End Sub

    Sub SetParameters()

        Me.Inizio.Text = "2020-01-01"
        Me.Fine.Text = DateTime.Now.ToString("yyyy-MM-dd")
        Me.RankOrdine.Text = 5000
        Me.StepOrdine.Text = 5
    End Sub


    Sub LoadData()

        Dim adp As New SqlDataAdapter()
        Dim dt As DataTable = New DataTable
        Try
            GetConn("cs")

            cmd = New SqlCommand("spr_RankOrdini_v2", cn)

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@dal", Me.Inizio.Text)
            cmd.Parameters.AddWithValue("@al", Me.Fine.Text)
            cmd.Parameters.AddWithValue("@TotRankValore", Me.RankOrdine.Text)
            cmd.Parameters.AddWithValue("@StepRankValore", Me.StepOrdine.Text)
            cmd.Parameters.AddWithValue("@PremioPosValore", 5)
            cmd.Parameters.AddWithValue("@PremioPosLimiteTop", 5)
            cmd.Parameters.AddWithValue("@TotRankAgente", 50)
            cmd.Parameters.AddWithValue("@StepRankAgente", 1.5)

            adp.SelectCommand = cmd
            adp.Fill(dt)
            cn.Close()

            With Me.GridOrdini


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

    Protected Sub btnExec_Click(sender As Object, e As EventArgs)
        LoadData()
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

        cmd = New SqlCommand("SELECT PeopleID ID,Custom06 Bonus, cf.Cd_CF, cf.Descrizione As Cliente FROM [PDB_FITAVATRADING].[dbo].[PeopleCustomFields] Pf INNER JOIN [PDB_FITAVATRADING].[dbo].[People] P ON pf.PeopleID=p.ID INNER JOIN ADB_FITAVATRADING.dbo.cf ON p.Code = cf.Cd_CF WHERE Custom06<>'' ORDER BY Descrizione", cn)

        adp.SelectCommand = cmd
        adp.Fill(dt)
        cn.Close()
        If dt.Tables(0).Rows.Count > 0 Then

            Me.RepBonus.DataSource = dt
            Me.RepBonus.DataBind()

            Me.GridBonus.DataSource = dt
            Me.GridBonus.DataBind()

        End If


    End Sub




    Protected Sub GridOrdini_PageIndexChanging(sender As Object, e As GridViewPageEventArgs)
        GridOrdini.PageIndex = e.NewPageIndex
        LoadData()
    End Sub

    Private Sub RepBonus_ItemCommand(source As Object, e As RepeaterCommandEventArgs) Handles RepBonus.ItemCommand
        If e.CommandName = "Delete" Then

            GetConn("p")

            cmd = New SqlCommand("UPDATE [PDB_FITAVATRADING].[dbo].[PeopleCustomFields] SET Custom06='' WHERE Peopleid=@id", cn)
            cmd.Parameters.AddWithValue("id", e.CommandArgument)
            cmd.ExecuteNonQuery()
            RepBonus.DataBind()
            'ListCustomerBonus()

        End If
    End Sub

    Protected Sub btnUpdate_Click(sender As Object, e As EventArgs)
        If Me.txtBonus.Text <> "" And Me.ddCustomerList.SelectedItem.Value <> "" Then

            GetConn("p")

            cmd = New SqlCommand("UPDATE PeopleCustomFields SET Custom06=@bonus WHERE PeopleID=(SELECT ID FROM People WHERE Code=@code)", cn)
            cmd.Parameters.AddWithValue("bonus", Me.txtBonus.Text)
            cmd.Parameters.AddWithValue("Code", Me.ddCustomerList.SelectedItem.Value)
            cmd.ExecuteNonQuery()
            ListCustomerBonus()
            Me.txtBonus.Text = ""
            Me.ddCustomerList.Text = ""
        End If
    End Sub


End Class