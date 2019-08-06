<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ok.aspx.cs" Inherits="sakim.ok" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Final</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"/>
    
    <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    
</head>
<body>
    <div class="container">
        <div class="row jumbotron">
            <div class="col-md-3">
                <button class="btn btn-success ml-3" id="back" >Back</button>
            </div>
            <div class="col-md-6" id="Content">

            </div>
        </div>
    </div>

    <script>
        $('#back').click(function () {
            $.ajax({
                type: "POST",
                url: "ok.aspx/GetData",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var Table = "<table border='1' class='table table-striped table-dark table-hover '>" +

                                    "<tr>" +
                                        "<td style='text-align:center'><strong>Course Name</strong></td>" +
                                        "<td style='text-align:center'><strong>Room</strong></td>" +
                                     "</tr>";
                    for (var i = 0; i < data.d.length; i++) {
                        Table += "<tr>" +
                                    "<td><button class='ss2'style='cursor:pointer; width:100%;outline:none;background-color:#407780;border:none;color:white' id1=" + data.d[i].course_name + ">" + data.d[i].course_name + "</button></td>" +
                                    "<td><button class='ss' style='cursor:pointer; width:100%;outline:none;background-color:#407780;border:none;color:white' id2=" + data.d[i].room + ">" + data.d[i].room + "</button></td>" +
                                  "</tr>";
                    }
                    Table += "</table>";
                    $('#Content').html(Table);

                },
                failure: function (response) {
                    alert(response.d);
                }
            });
        });
        
        $(document).ready(function () {
            
            $.ajax({
                type: "POST",
                url: "ok.aspx/GetData",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var Table = "<table border='1' class='table table-striped table-dark table-hover '>" +
                                   
                                    "<tr>" +
                                        "<td style='text-align:center'><strong>Course Name</strong></td>" +
                                        "<td style='text-align:center'><strong>Room</strong></td>" +
                                     "</tr>";
                    for (var i = 0; i < data.d.length; i++) {
                        Table += "<tr>" +
                                    "<td><button class='ss2'style='cursor:pointer; width:100%;outline:none;background-color:#407780;border:none;color:white' id1=" + data.d[i].course_name + ">" + data.d[i].course_name + "</button></td>" +
                                    "<td><button class='ss' style='cursor:pointer; width:100%;outline:none;background-color:#407780;border:none;color:white' id2=" + data.d[i].room + ">" + data.d[i].room + "</button></td>" +
                                  "</tr>";
                    }
                    Table += "</table>";
                    $('#Content').html(Table);
                    
                        },
                failure: function (response) {
                    alert(response.d);
                }
            });
        });

         $("body").delegate(".ss2", "click", function (event) {
             event.preventDefault();
             var rm = $(this).attr("id1");
             $.ajax(
                 {
                    type: "POST",
                    url: "ok.aspx/GetData1",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ room: rm }),
                    success: function (data)
                    {
                        var Table = "<table border='1' class='table table-striped table-dark table-hover '>" +
                                    "<tr>" +
                                        "<td  style='text-align:center'><strong>Student Id</strong></td>" +
                                        "<td style='text-align:center'><strong>Student Name</strong></td>" +
                                    "</tr>";
                        for (var i = 0; i < data.d.length; i++) {
                            Table += "<tr>" +
                                        "<td><button style='cursor:pointer; width:100%;outline:none;background-color:#407780;border:none;color:white'>" + data.d[i].student_id + "</button></td>" +
                                        "<td><button style='cursor:pointer; width:100%;outline:none;background-color:#407780;border:none;color:white'>" + data.d[i].name + "</button></td>" +
                                    "</tr>";
                        }
                        Table += "</table>";
                        $('#Content').html(Table);
                    },
                    failure: function (response) {
                        alert(response.d);
                    }
                });
         });    

        
         $("body").delegate(".ss", "click", function (event) {
             event.preventDefault();
             var rm1 = $(this).attr("id2");
             $.ajax({
                     type: "POST",
                     url: "ok.aspx/GetData2",
                     contentType: "application/json; charset=utf-8",
                     dataType: "json",
                     data: JSON.stringify({ name: rm1 }),
                     success: function (data) {
                         var Table = "<table border='1' class='table table-striped table-dark table-hover '>" +
                                           "<tr>" +
                                               "<td style='text-align:center'><strong>Room</strong></td>" +
                                               "<td style='text-align:center'><strong>Course Name</strong></td>" +
                                            "</tr>";
                         for (var i = 0; i < data.d.length; i++) {
                             Table += "<tr>" +
                                         "<td><button  style='cursor:pointer; width:100%;outline:none;background-color:#407780;border:none;color:white'>" + data.d[i].room + "</button></td>" +
                                         "<td><button class='so' style='cursor:pointer; width:100%;outline:none;background-color:#407780;border:none;color:white' id8=" + data.d[i].course_name + ">" + data.d[i].course_name + "</button></td>" +
                                       "</tr>";
                         }
                         Table += "</table>";
                         $('#Content').html(Table);
                     },
                     failure: function (response) {
                         alert(response.d);
                     }
                 });
             });
             
        
         $("body").delegate(".so", "click", function (event) {
             event.preventDefault();
             var rm5 = $(this).attr("id8");
             $.ajax({
                 type: "POST",
                 url: "ok.aspx/GetData6",
                 contentType: "application/json; charset=utf-8",
                 dataType: "json",
                 data: JSON.stringify({ name1: rm5 }),
                 success: function (data) {
                     var Table = "<table border='1' class='table table-striped table-dark table-hover '>" +
                                       "<tr>" +
                                           "<td style='text-align:center'><strong>Student Id</strong></td>" +
                                           "<td style='text-align:center'><strong>Student Name</strong></td>" +
                                        "</tr>";
                     for (var i = 0; i < data.d.length; i++) {
                         Table += "<tr>" +
                                     "<td><button style='cursor:pointer; width:100%;outline:none;background-color:#407780;border:none;color:white'>" + data.d[i].student_id + "</button></td>" +
                                     "<td><button style='cursor:pointer; width:100%;outline:none;background-color:#407780;border:none;color:white'>" + data.d[i].name + "</button></td>" +
                                   "</tr>";
                     }
                     Table += "</table>";
                     $('#Content').html(Table);
                 },
                 failure: function (response) {
                     alert(response.d);
                 }
             });
         });
    </script>
</body>
</html>
