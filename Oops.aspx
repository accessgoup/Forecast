﻿<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Oops.aspx.vb" Inherits="FORECAST.Oops" %>

<!DOCTYPE html>

<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>Error Page - FORECAST</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
        <meta content="Coderthemes" name="author" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <!-- App favicon -->
        <link rel="shortcut icon" href="../assets/images/favicon.ico">

		<!-- App css -->
		<link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" id="bs-default-stylesheet" />
		<link href="../assets/css/app.min.css" rel="stylesheet" type="text/css" id="app-default-stylesheet" />

		<link href="assets/css/bootstrap-dark.min.css" rel="stylesheet" type="text/css" id="bs-dark-stylesheet" />
		<link href="assets/css/app-dark.min.css" rel="stylesheet" type="text/css" id="app-dark-stylesheet" />

		<!-- icons -->
		<link href="assets/css/icons.min.css" rel="stylesheet" type="text/css" />

   </head>
<body class="loading">

        <div class="account-pages my-5">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-8 col-lg-6 col-xl-5">
                        <div class="card">

                            <div class="card-body p-4">

                                <div class="error-ghost text-center">
                                    <img src="../assets/images/error.svg" width="200" alt="error-image"/>
                                </div>

                                <div class="text-center">
                                    <h3 class="mt-4 text-uppercase font-weight-bold">Page not found </h3>
                                    <p class="text-muted mb-0 mt-3" style="line-height: 20px;">
                                        <asp:Literal ID="litError" runat="server"></asp:Literal>    
                                    <a class="btn btn-primary mt-3" href="index.html"><i class="mdi mdi-reply mr-1"></i> Ritorna alla pagina </a>
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
        <!-- end page -->

        <footer class="footer footer-alt">
            <script>document.write(new Date().getFullYear())</script> &copy; FORECAST by <a href="http://braincomputing.com">Brain Computing</a> 
        </footer>

        <!-- Vendor js -->
        <script src="../assets/js/vendor.min.js"></script>

        <!-- App js -->
        <script src="../assets/js/app.min.js"></script>
    

       

</body>
</html>