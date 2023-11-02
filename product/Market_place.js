const image_1 = document.querySelectorAll(".img-1");
const image_2 = document.querySelectorAll(".img-2");
const image_3 = document.querySelectorAll(".img-3");

let activeClass = 3; // Set initial activeImg to 3 for image_3
let nextImage = 1;

setInterval(function () {
  nextImage = nextImage + 1;

  if (nextImage === 1) {
    image_2.forEach((image) => image.classList.replace("active", "hidden"));
    image_3.forEach((image) => image.classList.replace("active", "hidden"));
    image_1.forEach((image) => image.classList.replace("hidden", "active"));
    activeImgClass = nextImage;
  } else if (nextImage === 2) {
    image_1.forEach((image) => image.classList.replace("active", "hidden"));
    image_3.forEach((image) => image.classList.replace("active", "hidden"));
    image_2.forEach((image) => image.classList.replace("hidden", "active"));
    activeImgClass = nextImage;
  } else {
    image_1.forEach((image) => image.classList.replace("active", "hidden"));
    image_2.forEach((image) => image.classList.replace("active", "hidden"));
    image_3.forEach((image) => image.classList.replace("hidden", "active"));
    activeImgClass = nextImage;
    nextImage = 0;
  }
}, 3000);

const SignUpPage = document.getElementById("Sign-up");
const overLay = document.querySelector(".overlay");
const LoginPage = document.querySelector(".loginPage")
const CloseLogin = document.querySelector(".login-1")
const login = document.getElementsByClassName("Sign-form");

SignUpPage.addEventListener("click", function showSignUp() {
  document.querySelector(".Create-Acc").style.display = "block";
  document.querySelector(".overlay").style.display = "block";
});

overLay.addEventListener("click", function () {
  document.querySelector(".Create-Acc").style.display = "none";
  document.querySelector(".overlay").style.display = "none";
  document.querySelector(".login").style.display = "none"
  document.querySelector(".Upload-Nft").style.display = "none";


});

LoginPage.addEventListener("click", function () {
  document.querySelector(".Create-Acc").style.display = "none";
  document.querySelector(".login").style.display = "block"
  document.querySelector(".overlay").style.display = "block";
})

CloseLogin.addEventListener("click", function () {
  document.querySelector(".login").style.display = "none";
  document.querySelector(".overlay").style.display = "none";
})

const uplaod_page = document.getElementById('Upload_nft')
const upload_btn = document.querySelector('.Upload-btn')

uplaod_page.addEventListener('click', function () {
  document.querySelector(".Upload-Nft").style.display = "block";
  document.querySelector(".overlay").style.display = "block";
})

upload_btn.addEventListener('click', function () {
  document.querySelector(".Upload-Nft").style.display = "none";
  document.querySelector(".overlay").style.display = "none";
})