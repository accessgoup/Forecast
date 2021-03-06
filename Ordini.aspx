﻿<%@ Page Title="" Language="vb" AutoEventWireup="false" EnableEventValidation="false" MasterPageFile="~/Generale.Master" CodeBehind="Ordini.aspx.vb" Inherits="FORECAST.Ordini" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>FORECAST - ANALISI</title>

    <style>
        .Tabella2RigheAlternate tr:nth-child(4n+1), .Tabella2RigheAlternate tr:nth-child(4n+2) {background: #808080; color:white;}

    </style>
    
</asp:Content>

<asp:Content ID="TopMenu" ContentPlaceHolderID="ContentPlaceHolderTopMenu" runat="server">
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">




    <div class="content-page">
        <div class="content">
            <div class="row">
                <div class="col-xl-3 col-md-6">
                    <div class="card widget-icon">
                        <div class="card-body">
                            <div class="media">
                                <div class="avatar-lg">
                                    <i class="mdi mdi-chart-line text-primary avatar-title display-4 m-0"></i>
                                </div>
                                <div class="wid-icon-info media-body text-right">
                                    <p class="text-muted mb-1 font-13 text-uppercase">PREVENTIVI PERIODO</p>
                                    <h4 class="mb-1 counter">
                                        <asp:Literal ID="litValorePreventivo" runat="server"></asp:Literal>
                                    </h4>
                                    <small class="text-success"><b>
                                        <asp:Literal ID="litValorePreventivoAnnoPrec" runat="server"></asp:Literal></b></small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-md-6">
                    <div class="card widget-icon">
                        <div class="card-body">
                            <div class="media">
                                <div class="avatar-lg">
                                    <i class="mdi mdi-chart-line text-primary avatar-title display-4 m-0"></i>
                                </div>
                                <div class="wid-icon-info media-body text-right">
                                    <p class="text-muted mb-1 font-13 text-uppercase">ORDINATO PERIODO</p>
                                    <h4 class="mb-1 counter">
                                        <asp:Literal ID="LitOrdiniPeriodo" runat="server"></asp:Literal>
                                    </h4>
                                    <small class="text-success"><b>
                                        <asp:Literal ID="LitOrdini" runat="server"></asp:Literal></b></small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-xl-3 col-md-6">
                    <div class="card widget-icon">
                        <div class="card-body">
                            <div class="media">
                                <div class="avatar-lg">
                                    <i class="mdi mdi-chart-multiple text-primary avatar-title display-4 m-0"></i>
                                </div>
                                <div class="wid-icon-info media-body text-right">
                                    <p class="text-muted mb-1 font-13 text-uppercase">NUM RICHIESTE</p>
                                    <h4 class="mb-1 counter">
                                        <asp:Literal ID="litRichiestePeriodo" runat="server"></asp:Literal>
                                    </h4>
                                    <small class="text-success"><b>
                                        <asp:Literal ID="LitNumeroPreventivi" runat="server"></asp:Literal></b></small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-md-6">
                    <div class="card widget-icon">
                        <div class="card-body">
                            <div class="media">
                                <div class="avatar-lg">
                                    <i class="fe-trending-up text-primary avatar-title display-4 m-0"></i>
                                </div>
                                <div class="wid-icon-info media-body text-right">
                                    <p class="text-muted mb-1 font-13 text-uppercase">Media Tasso Converione Periodo</p>
                                    <h4 class="mb-1 counter">
                                        <asp:Literal ID="LitMediaConversionePeriodo" runat="server"></asp:Literal>
                                    </h4>
                                    <small class="text-success"><b>
                                        <asp:Literal ID="LitMediaConversione" runat="server"></asp:Literal></b></small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            
                            <div class="form-inline">
                                <div class="col-8"></div>
                                <h6 class=" m-1">LEGENDA</h6>
                                <div class="col-1 badge-success m-1">RANK CALCOLATO</div>
                                <div class="col-1 badge-primary m-1">ANALISI PERIODO</div>
                                <div class="col-1 badge-secondary m-1">ANALISI STORICA</div>
                            </div>
                            
                                
                            <div class="table table-responsive table-sm">
                                <asp:GridView ID="GridOrdini" runat="server" AutoGenerateColumns="False" AllowSorting ="true"
                                    AllowPaging="True" AutoSizeColumnsMode="false" 
                                    OnSorting="TaskGridView_Sorting" OnPageIndexChanging="GridOrdini_PageIndexChanging"
                                    CssClass="table table-centered table-nowrap mb-0"  >


                                    <PagerStyle CssClass="pagination-ys" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="#ORD" SortExpression="POS" >
                                            <ItemTemplate><%#Eval("Pos") %></ItemTemplate>
                                            <ItemStyle Width="10 px" CssClass="bg-primary" ForeColor="White" />
                                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="#PREV" SortExpression="PosPrev">
                                            <ItemTemplate><%#Eval("PosPrev") %></ItemTemplate>
                                            <ItemStyle Width="10 px" CssClass="bg-primary" ForeColor="White" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="CODICE" SortExpression="CodiceCliente" ItemStyle-Width="15 px">
                                            <ItemTemplate><%#Eval("CodiceCliente") %></ItemTemplate>
                                            <ItemStyle Width="10px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="CLIENTE">
                                            <ItemTemplate><%#Eval("Cliente") %></ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="PREV" SortExpression="ScoreValorePreventivoPeriodo" ItemStyle-Width="5 px" ItemStyle-CssClass="bg-success" ItemStyle-ForeColor="White">
                                            <ItemTemplate><%#Eval("ScoreValorePreventivoPeriodo") %></ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="BONUS" SortExpression="Bonus" ItemStyle-Width="5 px" ItemStyle-CssClass="bg-success" ItemStyle-ForeColor="White">
                                            <ItemTemplate><%#Eval("Bonus") %></ItemTemplate>
                                        </asp:TemplateField>
                                       <%-- <asp:TemplateField HeaderText="AGENTE" SortExpression="BonusAgente" ItemStyle-Width="5 px" ItemStyle-CssClass="bg-success" ItemStyle-ForeColor="White">
                                            <ItemTemplate><%#Eval("BonusAgente") %></ItemTemplate>
                                        </asp:TemplateField>--%>

                                        <asp:TemplateField HeaderText="PREV"  ItemStyle-Width="35 px" ItemStyle-CssClass="bg-primary" ItemStyle-ForeColor="White" ItemStyle-Font-Bold="true">
                                            <ItemTemplate><%#Eval("ValorePreventiviPeriodo", "{0:c}") %></ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="VALORE<br/>ORDINI" ItemStyle-Width="10 px" ItemStyle-CssClass="bg-primary" ItemStyle-ForeColor="White" ItemStyle-Font-Bold="true">
                                            <ItemTemplate><%#Eval("ImportoOrdinatoPeriodo", "{0:c}") %></ItemTemplate>
                                            <ItemStyle CssClass="bg-primary" ForeColor="White"></ItemStyle>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="CONV<br/>PR>OR" ItemStyle-Width="10 px" ItemStyle-CssClass="bg-primary" ItemStyle-ForeColor="White" ItemStyle-Font-Bold="true">
                                            <ItemTemplate><%#Eval("MediaTassoConversionePeriodo", "{0:#0%}") %></ItemTemplate>
                                            <ItemStyle CssClass="bg-primary" ForeColor="White"></ItemStyle>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="RICH" ItemStyle-Width="15 px" ItemStyle-CssClass="bg-primary" ItemStyle-ForeColor="White">
                                            <ItemTemplate><%#Eval("RichiestePeriodo") %></ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="POS<br/>RICH" ItemStyle-Width="10 px">
                                            <ItemTemplate><%#Eval("PosRichiestePeriodo") %></ItemTemplate>
                                            <ItemStyle CssClass="bg-primary" ForeColor="White"></ItemStyle>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="RIGHE<br/>PREV" ItemStyle-Width="15 px" ItemStyle-CssClass="bg-primary" ItemStyle-ForeColor="White">
                                            <ItemTemplate><%#Eval("RighePreventiviPeriodo") %></ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="% ORD" ItemStyle-Width="15 px" ItemStyle-CssClass="bg-primary" ItemStyle-ForeColor="White">
                                            <ItemTemplate><%#Eval("PercOrdinato", "{0:#0.00}") %></ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="% ORD<br/>CORR" ItemStyle-Width="15 px" ItemStyle-CssClass="bg-primary" ItemStyle-ForeColor="White">
                                            <ItemTemplate><%#Eval("PercOrdinatoCurr", "{0:#0.00}") %></ItemTemplate>
                                        </asp:TemplateField>


                                        <asp:TemplateField HeaderText="PREV" ItemStyle-Width="40 px" ItemStyle-CssClass="bg-secondary" ItemStyle-ForeColor="White">
                                            <ItemTemplate><%#Eval("ValorePreventivi", "{0:c}") %></ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="ORDINI" ItemStyle-Width="45 px" ItemStyle-CssClass="bg-secondary" ItemStyle-ForeColor="White">
                                            <ItemTemplate><%#Eval("ImportoOrdinato", "{0:c}") %></ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="CONV<br/>PR>OR" ItemStyle-Width="10 px" ItemStyle-CssClass="bg-secondary" ItemStyle-ForeColor="White" ItemStyle-Font-Bold="true">
                                            <ItemTemplate><%#Eval("MediaTassoConversione", "{0:#0%}") %></ItemTemplate>
                                            <ItemStyle CssClass="bg-secondary" ForeColor="White"></ItemStyle>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="RICHE<br/>RICH" ItemStyle-Width="15 px" ItemStyle-CssClass="bg-secondary" ItemStyle-ForeColor="White">
                                            <ItemTemplate><%#Eval("RichiesteTotali") %></ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="RIGHE<br/>PREV" ItemStyle-Width="40 px" ItemStyle-CssClass="bg-secondary" ItemStyle-ForeColor="White">
                                            <ItemTemplate><%#Eval("RighePreventivi") %></ItemTemplate>
                                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="PREV<br/>PREC" ItemStyle-Width="35 px" ItemStyle-CssClass="bg-primary" ItemStyle-ForeColor="White" ItemStyle-Font-Bold="true">
                                            <ItemTemplate><%#Eval("ValorePreventiviPeriodoAnnoPrec", "{0:c}") %></ItemTemplate>
                                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="ORDINI<br/>PREC" ItemStyle-Width="10 px" ItemStyle-CssClass="bg-primary" ItemStyle-ForeColor="White" ItemStyle-Font-Bold="true">
                                            <ItemTemplate><%#Eval("ImportoOrdinatoPeriodoAnnoPrec", "{0:c}") %></ItemTemplate>
                                            <ItemStyle CssClass="bg-primary" ForeColor="White"></ItemStyle>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="AGENTE" ItemStyle-Width="50 px" ItemStyle-CssClass="bg-pink" ItemStyle-ForeColor="White">
                                            <ItemTemplate><%#Eval("Agente") %></ItemTemplate>
                                        </asp:TemplateField>


                                       
                                    </Columns>

                                </asp:GridView>
                            </div>


                                <div class="table table-responsive table-sm">
                                <asp:GridView ID="GridClienti" Visible="false" runat="server" AutoGenerateColumns="False" AllowSorting ="true"
                                    AllowPaging="True" AutoSizeColumnsMode="false" 
                                    OnSorting="TaskGridView_Sorting" OnPageIndexChanging="GridOrdini_PageIndexChanging"
                                    CssClass="table table-centered table-nowrap mb-0"  >


                                    <PagerStyle CssClass="pagination-ys" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="Bonus" SortExpression="Bonus">
                                            <ItemTemplate><small><%#Eval("Bonus") %></small></ItemTemplate>
                                            <ItemStyle Width="10 px" CssClass="bg-primary" ForeColor="White" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Cliente" SortExpression="Cliente" >
                                            <ItemTemplate><small><%#Eval("Cliente") %></small></ItemTemplate>
                                            <ItemStyle Width="10 px" />
                                        </asp:TemplateField>
                                         
                                        <asp:TemplateField HeaderText="Da" SortExpression="Da">
                                            <ItemTemplate><small><%#Eval("A") %></small></ItemTemplate>
                                            <ItemStyle Width="10px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="A">
                                            <ItemTemplate><small><%#Eval("A") %></small></ItemTemplate>
                                            <ItemStyle Width="10px" />
                                        </asp:TemplateField>
                                       
                                    </Columns>

                                </asp:GridView>
                            </div>



                        </div>
                    </div>
                </div>
                <!-- end col -->
            </div>
            <!-- end row -->



        </div>



        <!-- content -->
    </div>



    <div class="right-bar">
        <div class="h-100">

            <ul class="nav nav-tabs nav-bordered nav-justified" role="tablist">
                <li class="nav-item">
                    <a class="nav-link py-2 active" data-toggle="tab" href="#settings-tab" role="tab">
                        <i class="mdi mdi-cog-outline d-block font-22 my-1"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link py-2" data-toggle="tab" href="#bonus-tab" role="tab">
                        <i class="mdi mdi-format-list-checkbox d-block font-22 my-1"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link py-2" data-toggle="tab" href="#kpi-tab" role="tab">
                        <i class="mdi mdi-apache-kafka d-block font-22 my-1"></i>
                    </a>
                </li>

                
            </ul>
            <div class="tab-content pt-0">
                <div class="tab-pane active" id="settings-tab" role="tabpanel">
                    
                    <div class="form-group p-3">
                        <h6 class="font-weight-medium px-3 mt-1 text-uppercase">INIZIO</h6>
                        <div class="position-relative">
                            <asp:TextBox runat="server" CssClass="form-control" TextMode="Date" ID="Inizio"></asp:TextBox>
                        </div>
                        <h6 class="font-weight-medium px-3 mt-1 text-uppercase">FINE</h6>
                        <div class="position-relative">
                            <asp:TextBox runat="server" CssClass="form-control" TextMode="Date" ID="Fine"></asp:TextBox>
                        </div>
                        <hr />
                        <h6 class="font-weight-medium px-3 mt-1 text-uppercase">SCORE SU ORDINATO</h6>
                        <div class="position-relative">
                            <asp:TextBox runat="server" CssClass="form-control" TextMode="Number" ID="RankOrdine"></asp:TextBox>
                        </div>
                        <h6 class="font-weight-medium px-3 mt-1 text-uppercase">STEP SU ORDINATO</h6>
                        <div class="position-relative">
                            <asp:TextBox runat="server" CssClass="form-control" TextMode="Number" ID="StepOrdine"></asp:TextBox>
                        </div>
                        <hr />
                        <h6 class="font-weight-medium px-3 mt-1 text-uppercase">SCORE SU AGENTE</h6>
                        <div class="position-relative">
                            <asp:TextBox runat="server" CssClass="form-control" TextMode="Number" ID="RankAgente"></asp:TextBox>
                        </div>
                        <h6 class="font-weight-medium px-3 mt-1 text-uppercase">STEP SU AGENTE</h6>
                        <div class="position-relative">
                            <asp:TextBox runat="server" CssClass="form-control" TextMode="Number" ID="stepAgente"></asp:TextBox>
                        </div>
                        <hr />
                        <div class="form-inline">
                            <asp:Label runat="server" CssClass="forma-control">FILTRO CODICE O NOME CLIENTE</asp:Label>
                            <asp:TextBox ID="txtFilter" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-inline">
                            <asp:Label runat="server" CssClass="forma-control m-1">LIMITE POSIZIONE </asp:Label>
                            <asp:TextBox ID="txtLimitRows" runat="server" TextMode="Number"  ToolTip="METTI 0 SE VUOI TUTTI" CssClass="form-control"></asp:TextBox>
                        </div>
                        <asp:Button ID="btnExec" runat="server" Text="RIELABORA" CssClass="btn btn-block btn-primary mt-1" OnClick="btnExec_Click" />
                        <asp:Button ID="btnUpdateSP" runat="server" Text="AGGIORNA RANK" CssClass="btn btn-block btn-primary mt-1" OnClick="btnExec_Click" />
                    </div>
                </div>
                <div class="tab-pane" id="bonus-tab" role="tabpanel">
                    <div class="form-group px-3">
                         <div class="m-1">
                            <asp:Button ID="btnShowClienti" runat="server" CssClass="pl-3 btn btn-primary" Text="MOSTR ABONUS CLIENTI" />
                        </div>
                        <div class="position-relative">
                            <h6 class="font-weight-medium px-3 mt-2 text-uppercase">BONUS CLIENTI</h6>
                            <asp:DropDownList ID="ddCustomerList" CssClass="form-control" runat="server">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-inline">
                        <div class="position-relative pl-3">
                            <asp:TextBox ID="txtDa" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="position-relative my-2 pl-3">
                            <asp:TextBox ID="txtA" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-inline">
                        <div class="pl-3">
                            <asp:TextBox ID="txtBonus" Width="30px" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="mt-1">
                            <asp:Button ID="btnUpdate" runat="server" OnClick="btnUpdate_Click" CssClass="btn btn-primary" Text="ASSEGNA" />
                        </div>
                       
                    </div>
                    <div class="form-group px-3 m-1">
                      <%--  <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                        <asp:UpdatePanel ID="upFC" runat="server" UpdateMode="Always" ChildrenAsTriggers="true">
                            <ContentTemplate>
                                <asp:Repeater ID="RepBonus" runat="server">
                                    <HeaderTemplate>
                                        <table class="table table-responsive table-sm Tabella2RigheAlternate mt-1">
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td colspan="2" style="width: 60%">
                                                <%# DataBinder.Eval(Container.DataItem, "Cliente") %> 
                                            </td>
                                            <td style="width: 20%">
                                                <%# DataBinder.Eval(Container.DataItem, "Bonus") %> 
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <small><%# DataBinder.Eval(Container.DataItem, "Da") %></small>
                                            </td>
                                            <td>
                                                <small><%# DataBinder.Eval(Container.DataItem, "A") %></small>
                                            </td>
                                         <td>
                                            <asp:LinkButton runat="server" CommandName="Delete" CommandArgument='<%# Eval("ID") %>' CssClass="btn btn-danger" Text="X" />
                                         </td>   
                                        </tr>
                                    </ItemTemplate>

                                    <FooterTemplate>
                                        </table>
                                    </FooterTemplate>
                                </asp:Repeater>
                        </ContentTemplate>
                            <Triggers>
                                 <asp:AsyncPostBackTrigger ControlID="RepBonus" />
                            </Triggers>
                        </asp:UpdatePanel>--%>
                    </div>

                </div>
                <div class="tab-pane" id="kpi-tab">
                     <div class="form-group px-3">
                        <asp:Repeater ID="RepKPI" runat="server">
                            <HeaderTemplate>
                                <h6>KPI ORDINATO</h6>
                                <table class="table table-responsive Tabella2RigheAlternate  mt-1">
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td colspan="2"><%# DataBinder.Eval(Container.DataItem, "Operatore") %></td>
                                </tr>
                                    <td><%# DataBinder.Eval(Container.DataItem, "Preventivato", "{0:c}") %> </td>
                                    <td><%# DataBinder.Eval(Container.DataItem, "NumPreventivi") %></td>
                                </tr>
                               
                            </ItemTemplate>

                            <FooterTemplate>
                                </table>
                            </FooterTemplate>
                        </asp:Repeater>

                    </div>

                </div>

            </div>
        </div>



        <!-- end slimscroll-menu-->
    </div>
        <!-- /Right-bar -->

        <!-- Right bar overlay-->
        <div class="rightbar-overlay"></div>


    <script src="assets/js/vendor.min.js"></script>
    <script src="assets/js/app.min.js"></script>






</asp:Content>
