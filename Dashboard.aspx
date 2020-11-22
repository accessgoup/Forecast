<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Dashboard.aspx.vb" Inherits="FORECAST.Dashboard" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta charset="utf-8" />
        <title>FORECAST</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        
        <meta content="Coderthemes" name="author" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <!-- App favicon -->
        <link rel="shortcut icon" href="../assets/images/favicon.ico" />

		<!-- App css -->
		<link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css"  />
		<link href="assets/css/app.min.css" rel="stylesheet" type="text/css"  />
    
		<!-- icons -->
		<link href="assets/css/icons.min.css" rel="stylesheet" type="text/css" />

</head>
<body class="loading">
    <form id="form1" runat="server">
        <div class="row">
            <div class="col-lg-6">
                <div class="card">
                    <div class="card-body">
                        <h4 class="header-title">Multiple Statistics</h4>

                        <asp:Chart ID="Chart1" runat="server">
                            <Series>
                                <asp:Series Name="Series1"></asp:Series>
                            </Series>
                            <ChartAreas>
                                <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                            </ChartAreas>
                        </asp:Chart>
                    </div>
                </div>
                <!-- end card -->
            </div>
            <!-- end col -->

            
            
        </div>
        
        <asp:HiddenField ID="hfdata" runat="server"></asp:HiddenField>
        <asp:HiddenField ID="hflabel" runat="server"></asp:HiddenField>

    </form>
        
    <script type="application/javascript" src="awesomechart.js"></script>

  <script type="application/javascript">
    function drawMyChart() {
      if (!!document.createElement('canvas').getContext) { //check that the canvas
        // element is supported
        var mychart = new AwesomeChart('canvas1');
        mychart.title = "Product Sales - 2010";
        mychart.data = "<%=hfdata.Value%>";
        mychart.labels = "<%=hfdata.Value%>"
        mychart.draw();
      }
    }

    window.onload = drawMyChart;
  </script>
  <script src="awesomecharts.js"></script>
  <!-- Optional JavaScript -->
  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
    integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
    crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
    integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
    crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
    integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
    crossorigin="anonymous"></script>
      

   
    
        <script src="assets/js/vendor.min.js"></script>
        <script src="assets/js/app.min.js"></script>

        



</body>
</html>
