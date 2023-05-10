<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="fragments/header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.21/js/jquery.dataTables.min.js"
            integrity="sha512-BkpSL20WETFylMrcirBahHfSnY++H2O1W+UnEEO4yNIl+jI2+zowyoGJpbtk6bx97fBXf++WJHSSK2MV4ghPcg=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer">
    </script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script>
        let api = "http://localhost:8090";
        var token = localStorage.getItem("token");

        $(document).ready(function () {

            $.ajax({
                url: api + "/board/user/my-board",
                type: 'GET',
                async: false,
                cache: false,
                contentType: 'application/json; chartset=utf-8',
                success: function (data) {
                    $('#example2').DataTable({
                        pageLength: 10,
                        bPaginate: true,
                        bLengthChange: true,
                        lengthMenu: [[10, 20, 50, -1], [10, 20, 50, "All"]],
                        bAutoWidth: false,
                        processing: true,
                        ordering: true,
                        serverSide: false,
                        searching: true,
                        order: [],
                        data: data,
                        columnDefs: [{
                            "defaultContent": "-",
                            "targets": "_all"
                        }],
                        columns: [
                            {
                                data: null, render: function (data, type, row) {
                                    return data.title;
                                }
                            },
                            {
                                data: null, render: function (data, type, row) {
                                    return data.content;
                                }
                            },
                            {
                                data: null, render: function (data, type, row) {
                                    return data.questionStatus;
                                }
                            },
                            {
                                data: null, render: function (data, type, row) {
                                    return data.name;
                                }
                            },
                            {
                                data: null, render: function (data, type, row) {
                                    return data.email;
                                }
                            }
                        ]
                    })
                },
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("Authorization", "Bearer " + token);
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log(jqXHR.status + textStatus + errorThrown);
                }
            })
        })
    </script>
</head>
<body>
<h2 class="inquiry_title">이곳은 문의화면입니다</h2>

<div class="row">
    <div class="col-lg-12 col-md-12">
        <div class="box box-success">
            <div class="box-body">
                <table id="example2" class="table table-bordered table-hover">
                    <colgroup>
                        <col width="30%">
                        <col width="60%">
                        <col width="10%">
                    </colgroup>
                    <thead>
                    <tr>
                        <th>title</th>
                        <th>content</th>
                        <th>questionStatus</th>
                        <th>name</th>
                        <th>email</th>
                    </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</body>

<%@ include file="fragments/footer.jsp" %>