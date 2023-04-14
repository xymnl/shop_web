
let slide = document.querySelectorAll(".fs-slide");
let slideWrap = document.querySelector('.flexslider');
let slideCount = slide.length;
let curSlide = 0;
let isDragging = false;
let startPos = 0;
let endPos = 0;

window.onload = function() {
	document.addEventListener("DOMContentLoaded", function() {
		// 마우스 클릭 시
		slideWrap.addEventListener("mousedown", function (e) {
		  e.preventDefault();
		  isDragging = true;
		  startPos = e.clientX;
		});

		// 마우스 이동 시
		slideWrap.addEventListener("mousemove", function (e) {
		  if (isDragging) {
		    endPos = e.clientX;
		    let diff = startPos - endPos;
		    if (diff > 0) {
		      moveSlide(1);
		    } else if (diff < 0) {
		      moveSlide(-1);
		    }
		    startPos = endPos;
		  }
		});

		// 마우스 클릭 끝날 시
		slideWrap.addEventListener("mouseup", function (e) {
		  isDragging = false;
		});

		// 슬라이드 이동 함수
		function moveSlide(dir) {
		  slide[curSlide].classList.remove("active");
		  curSlide += dir;
		  if (curSlide < 0) {
		    curSlide = slideCount - 1;
		  } else if (curSlide >= slideCount) {
		    curSlide = 0;
		  }
		  slide[curSlide].classList.add("active");
		}
	});
}