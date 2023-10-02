$(document).ready(function() {
    $('form').submit(function(event) {
      event.preventDefault(); // Evita que se envíe el formulario
  
      // Recopilamos los datos del formulario
      var nombre = $('#nombre').val();
      var apellido = $('#apellido').val();
      var email = $('#email').val();
      var telefono = $('#telefono').val();
      var direccion = $('#direccion').val();
      var ciudad = $('#ciudad').val();
      var estado = $('#estado').val();
      var pais = $('#pais').val();
      var codigoPostal = $('#codigo-postal').val();
      var edad = $('#edad').val();
      var genero = $('#genero').val();
      var ocupacion = $('#ocupacion').val();
      var interes = $('#interes').val();
      var hobbies = $('#hobbies').val();
      var nivelEstudios = $('#estudios').val();
  
      // Creamos la factura con los datos del formulario
      var factura = '<h1>Factura de participación en la trivia</h1><br>';
      factura += '<p><strong>Nombre:</strong> ' + nombre + ' ' + apellido + '</p>';
      factura += '<p><strong>Email:</strong> ' + email + '</p>';
      factura += '<p><strong>Teléfono:</strong> ' + telefono + '</p>';
      factura += '<p><strong>Dirección:</strong> ' + direccion + '</p>';
      factura += '<p><strong>Ciudad:</strong> ' + ciudad + '</p>';
      factura += '<p><strong>Estado:</strong> ' + estado + '</p>';
      factura += '<p><strong>País:</strong> ' + pais + '</p>';
      factura += '<p><strong>Código Postal:</strong> ' + codigoPostal + '</p>';
      factura += '<p><strong>Edad:</strong> ' + edad + '</p>';
      factura += '<p><strong>Género:</strong> ' + genero + '</p>';
      factura += '<p><strong>Ocupación:</strong> ' + ocupacion + '</p>';
      factura += '<p><strong>Áreas de interés:</strong> ' + interes + '</p>';
      factura += '<p><strong>Hobbies:</strong> ' + hobbies + '</p>';
      factura += '<p><strong>Nivel de estudios:</strong> ' + nivelEstudios + '</p>';
  
      // Abrimos la factura en una nueva ventana
      var ventanaFactura = window.open('', 'Factura');
      ventanaFactura.document.write(factura);
      ventanaFactura.focus();
    });
  });
  