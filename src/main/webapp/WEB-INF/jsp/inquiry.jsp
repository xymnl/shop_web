<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="fragments/header.jsp" %>


<h2 class="inquiry_title">이곳은 문의화면입니다</h2>

<div class="container">
  <div class="row">
    <div class="col-xs-12">
      <table class="table table-bordered table-hover dt-responsive">
        <thead>
          <tr>
            <th>title</th>
            <th>name</th>
            <th>content</th>
            <th>questionStatus</th>
            <th>user</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>Argentina</td>
            <td>Spanish (official), English, Italian, German, French</td>
            <td>41,803,125</td>
            <td>31.3</td>
            <td>2,780,387</td>
          </tr>
          <tr>
            <td>Australia</td>
            <td>English 79%, native and other languages</td>
            <td>23,630,169</td>
            <td>37.3</td>
            <td>7,739,983</td>
          </tr>
          <tr>
            <td>Greece</td>
            <td>Greek 99% (official), English, French</td>
            <td>11,128,404</td>
            <td>43.2</td>
            <td>131,956</td>
          </tr>
          <tr>
            <td>Luxembourg</td>
            <td>Luxermbourgish (national) French, German (both administrative)</td>
            <td>536,761</td>
            <td>39.1</td>
            <td>2,586</td>
          </tr>
          <tr>
            <td>Russia</td>
            <td>Russian, others</td>
            <td>142,467,651</td>
            <td>38.4</td>
            <td>17,076,310</td>
          </tr>
          <tr>
            <td>Sweden</td>
            <td>Swedish, small Sami- and Finnish-speaking minorities</td>
            <td>9,631,261</td>
            <td>41.1</td>
            <td>449,954</td>
          </tr>
        </tbody>
      </table>
      
      <div class="paging">
      	<div class="page_btn first_btn"><<</div>
      	<div class="page_btn prev_btn"><</div>
      		<div class="pages">
      			<span class="active">1</span>
      			<span>2</span>
      			<span>3</span>
      			<span>4</span>
      			<span>5</span>
      		</div>
      	<div class="page_btn last_btn">>></div>
      	<div class="page_btn next_btn">></div>
      </div>
      
    </div>
  </div>
</div>
<script>
	$('table').DataTable();
</script>

<%@ include file="fragments/footer.jsp" %>