const apiUrl = 'https://api.chucknorris.io/jokes/random';

const btn = document.getElementById('btn');
const joke = document.getElementById('joke');

btn.addEventListener('click', () => {
    fetch(apiUrl)
        .then(response => response.json())
        .then(data => joke.innerHTML = data.value)
        .catch(error => console.error(error));
});
   
const apiUrl2 = "https://api.unsplash.com/photos/random";
const accessKey = "SXogdWA9GKq89nguTYw_mMKixRDk-5srJnRRQskgy1A";

// Obtener una imagen aleatoria desde la API
function obtenerImagenAleatoria() {
  const xhr = new XMLHttpRequest();
  xhr.open('GET', apiUrl2, true);
  xhr.setRequestHeader('Authorization', `Client-ID ${accessKey}`);
  xhr.onload = function() {
    if (xhr.status === 200) {
      // La solicitud se completó exitosamente
      const imagen = JSON.parse(xhr.responseText);
      actualizarImagen(imagen);
    } else {
      console.log('Error al obtener la imagen');
    }
  };
  xhr.send();
}

// Actualizar la imagen en la página
function actualizarImagen(imagen) {
  const imagenElemento = document.querySelector('#imagen img');
  imagenElemento.src = imagen.urls.regular;
  imagenElemento.alt = imagen.alt_description;
}

// Agregar un escuchador de eventos al botón
const boton = document.querySelector('#obtener-imagen-btn');
boton.addEventListener('click', obtenerImagenAleatoria);

const form = document.getElementById('weather-form');
      const result = document.getElementById('weather-result');

      form.addEventListener('submit', event => {
        event.preventDefault();
        const city = event.target.elements.city.value;
        const apiKey = 'f3dfe2475a1f6d6e857870dac37189ab'; // Reemplaza con tu propia clave de API de OpenWeatherMap
        const url = `https://api.openweathermap.org/data/2.5/weather?q=${city}&appid=${apiKey}&units=metric`;

        fetch(url)
          .then(response => response.json())
          .then(data => {
            const description = data.weather[0].description;
            const temperature = data.main.temp;
            const feelsLike = data.main.feels_like;
            const resultText = `The weather in ${city} is ${description} with a temperature of ${temperature}°C (feels like ${feelsLike}°C).`;
            result.textContent = resultText;
          })
          .catch(error => {
            console.error(error);
            result.textContent = 'An error occurred while fetching the weather data.';
          });
      });
