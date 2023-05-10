<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="fragments/header.jsp" %>

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
                
                <div class="pagenation_box">
	            	<ul class="pagination pagination-seperated "></ul>
	        	</div>
                
            </div>
        </div>
    </div>
</div>
</body>

<%@ include file="fragments/footer.jsp" %>