<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Index.aspx.vb" Inherits="FORECAST.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="utf-8" />
        <title>FORECAST</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
       
        <meta content="Coderthemes" name="author" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <!-- App favicon -->
        <link rel="shortcut icon" href="assets/images/favicon.ico" />

		<!-- App css -->
		<link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css"  />
		<link href="assets/css/app.min.css" rel="stylesheet" type="text/css"  />

		<!-- icons -->
		<link href="assets/css/icons.min.css" rel="stylesheet" type="text/css" />

</head>
<body class="loading">
    <form id="frmlogin" runat="server">
        <div class="account-pages mt-5 mb-5">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-8 col-lg-6 col-xl-5">
                        <div class="card">

                            <div class="card-body p-4">
                                
                                <div class="text-center w-75 m-auto">
                                    <div class="auth-logo">
                                        <a href="index.html" class="logo logo-dark text-center">
                                            <span class="logo-lg">
                                                <img src="assets/images/logosolo.png" alt="" height="22" />
                                            </span><h1>FORECAST</h1>
                                        </a>
                    
                                       
                                    </div>
                                    <p class="text-muted mb-4 mt-3">Software di analisi dati</p>
                                </div>

                                

                                    <div class="form-group mb-3">
                                        <label for="emailaddress">Utente</label>
                                        <asp:textbox CssClass="form-control" TextMode="SingleLine" placeholder="Inserisci nome utente" runat="server" id="emailaddress"></asp:textbox>
                                    </div>

                                    <div class="form-group mb-3">
                                        <label for="password">Password</label>
                                        <div class="input-group input-group-merge">
                                            <asp:TextBox runat="server" ID="password" CssClass="form-control" TextMode="Password" placeholder="Inserisci la password"></asp:TextBox>
                                            
                                        </div>
                                    </div>

                                    

                                    <div class="form-group mb-0 text-center">
                                        <asp:Button class="btn btn-primary btn-block" ID="btnLogin" runat="server" Text="LOG IN" />
                                        
                                    </div>

                                

                                

                            </div> <!-- end card-body -->
                        </div>
                        <!-- end card -->

                        

                    </div> <!-- end col -->
                </div>
                <!-- end row -->
            </div>
            <!-- end container -->
        </div>
    </form>
     <footer class="footer footer-alt">
            <script>document.write(new Date().getFullYear())</script> &copy; FORECAST by <a href="http://braincomputing.com" class="text-dark">BrainComputing S.p.A.</a> 
        </footer>

        <!-- Vendor js -->
        <script src="assets/js/vendor.min.js"></script>

        <!-- App js -->
        <script src="assets/js/app.min.js"></script>
</body>
</html>
