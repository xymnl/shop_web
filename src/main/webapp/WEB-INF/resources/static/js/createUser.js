let api = '${api}'
    $(function () {
		$("#btn-save").on("click", function (){ //this를 바인딩하기 위해 화샬표 함수 사용
		    let data = { //JavaScript Object
					email: $("#email").val(),
					name: $("#name").val(),
					password: $("#password").val(),
					address: $("#address").val()
			}
			$.ajax({
				type: "POST", //Http method
				async: 'true or false',
				url: api + "/user/new", //API 주소
				data: JSON.stringify(data), //JSON으로 변환
				contentType: "application/json; charset=utf-8", //MIME 타입
				dataType: "json" //응답 데이터
			}).done(function (res) {
				alert("회원가입이 완료되었습니다.");
				location.href = "/";
			}).fail(function (err) {
				alert(JSON.stringify(err));
			})
		})
    })
