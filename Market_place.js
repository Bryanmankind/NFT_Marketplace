let myIndex = 0;
const slides = document.getElementsByClassName("slide-img");

function changeImg() {
  let i;
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";
  }
  myIndex++;

  if (myIndex > slides.length) {
    myIndex = 1;
  }
  slides[myIndex - 1].style.display = "block";

  setTimeout(changeImg, 5000);
}

// changeImg();
