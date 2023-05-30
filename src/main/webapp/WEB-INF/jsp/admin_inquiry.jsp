<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<spring:eval expression="@environment.getProperty('api.server.url')" var="api" />
<%@ include file="fragments/header.jsp" %>

<div class="m-container">
	<div class="inquiry_box"></div>

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
	                    </tr>
	                    </thead>
	                    <tbody>
	                    </tbody>
	                </table>
	                <a href="/inquiry/create">문의작성</a>
	
	                <div class="pagination_box">
		            	<ul class="paginationI pagination-seperated"></ul>
		        	</div>	
	                
	            </div>
	        </div>
	    </div>
	</div> <!-- end : row -->
</div>
</body>
<script>
/* inquiry.jsp */
$(document).ready(function(){
 let api = '${api}';
 let token = localStorage.getItem("token");
   $.ajax({
       url: api + "/board/admin",
       type: 'GET',
       async: false,
       cache: false,
       contentType: 'application/json; charset=utf-8',
       success: function (data) {


           $('#example2').DataTable({
               pageLength: 10,
               bPaginate: false,
               bLengthChange: false,
               bAutoWidth: false,
               processing: true,
               ordering: true,
               serverSide: false,
               searching: false,
               info: false,
               order: [],
               data: data,
               columnDefs: [{
                   "defaultContent": "-",
                   "targets": "_all"
               }],
               columns: [
                   {
                       data: null, render: function (data, type, row) {
                    	   var title_link = '<a href="admin_inquiry_detail/'+data.id+'">'+data.title+'</a>';
                           return title_link;
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
                   }
               ]
           })
       },
       beforeSend: function (xhr) {
           xhr.setRequestHeader("Authorization", "Bearer " + token);
       },
       error: function (jqXHR, textStatus, errorThrown) {
            alert("일반회원은 접근할 수 없습니다.");
       }
   })
   jQuery('document').ready(function() {
		pagination();
		jQuery('.pagination li:first-child').addClass("disabled");
	});
});

</script>
<%@ include file="fragments/footer.jsp" %>