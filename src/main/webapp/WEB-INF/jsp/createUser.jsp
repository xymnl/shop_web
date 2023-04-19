<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="fragments/header.jsp" %>
	<div class="m-container">
		<div class="row my-10">
			 <!-- col -->
			 <div class="offset-lg-1 col-lg-10 col-12 ">
			    <div class="mb-8 py-3">
			       <h1 class="h3">회원가입</h1>
			       <p class="lead mb-0">Fresh Shop의 회원이 되어 혜택을 누리세요!</p>
			    </div>
			    <!-- form -->
			    <form action="#" class="row">
			       <!-- input -->
			       <div class="col-md-12 mb-3">
			          <label class="form-label" for="emailContact">Email<span class="text-danger">*</span></label>
			          <input type="email" id="emailContact" name="emailContact" class="form-control" placeholder="Enter Your First Name" required >
			       </div>
			       <div class="col-md-12 mb-3">
			          <label class="form-label" for="fname"> Name<span class="text-danger">*</span></label>
			          <input type="text" id="fname" class="form-control" name="fname" placeholder="Enter Your Name" required>
			       </div>
			       <div class="col-md-6 mb-3">
			          <!-- input -->
			          <label class="form-label" for="company"> password<span class="text-danger">*</span></label>
			          <input type="password" id="company" name="company" class="form-control" placeholder="password" required>
			       </div>
			       <div class="col-md-6 mb-3">
			          <!-- input -->
			          <label class="form-label" for="company"> password Check<span class="text-danger">*</span></label>
			          <input type="password" id="company" name="company" class="form-control" placeholder="password check" required>
			       </div>
			       <div class="col-md-12 mb-3">
			          <!-- input -->
			          <label class="form-label" for="title"> Address</label>
			          <input type="text" id="title" name="title" class="form-control" placeholder="Your address" required>
			       </div>
			       <div class="col-md-12">
			          <!-- btn -->
			          <button type="submit" class="btn btn-primary">회원가입 완료</button>
			       </div>
			    </form>
			  </div>
			</div>
		</div>
<%@include file="fragments/footer.jsp" %>