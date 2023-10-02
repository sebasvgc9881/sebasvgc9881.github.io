let slideIndex = 0;
const slides = document.getElementsByClassName("slide");
const intervalTime = 3000; // 3 segundos

// Función que muestra la siguiente imagen
function showNextSlide() {
  for (let i = 0; i < slides.length; i++) {
    slides[i].style.transform = `translateX(-${slideIndex}00%)`;
  }
  slideIndex++;
  if (slideIndex >= slides.length) {
    slideIndex = 0;
  }
}

// Iniciar temporizador
let slideInterval = setInterval(showNextSlide, intervalTime);

// Detener temporizador al hacer hover en el carrusel
const carousel = document.getElementsByClassName("carousel")[0];
carousel.addEventListener("mouseover", function() {
  clearInterval(slideInterval);
});

// Reanudar temporizador al quitar el mouse del carrusel
carousel.addEventListener("mouseout", function() {
  slideInterval = setInterval(showNextSlide, intervalTime);
});
