// Definir el carrito como un array vacío
let carrito = [];

// Obtener los botones "Agregar al carrito"
const botonesAgregar = document.querySelectorAll('.btn-agregar');

// Iterar sobre los botones y agregar un listener al evento "click"
botonesAgregar.forEach(boton => {
  boton.addEventListener('click', agregarAlCarrito);
});

// Función para agregar un producto al carrito
function agregarAlCarrito(evento) {
  // Obtener la información del producto seleccionado
  const boton = evento.target;
  const producto = boton.closest('.producto');
  const nombre = producto.dataset.nombre;
  const precio = producto.dataset.precio;

  // Comprobar si el producto ya está en el carrito
  const itemEnCarrito = carrito.find(item => item.nombre === nombre);

  // Si el producto está en el carrito, aumentar la cantidad
  if (itemEnCarrito) {
    itemEnCarrito.cantidad++;
  } else {
    // Si el producto no está en el carrito, agregarlo
    const item = {
      nombre: nombre,
      precio: precio,
      cantidad: 1
    };
    carrito.push(item);
  }

  // Guardar el carrito en el almacenamiento global
  localStorage.setItem('carrito', JSON.stringify(carrito));

  // Actualizar el carrito en la página
  mostrarCarrito();
}

// Función para mostrar el carrito en la página
function mostrarCarrito() {
  const tablaCarrito = document.getElementById('tablaCarrito');
  tablaCarrito.innerHTML = '';

  carrito.forEach(item => {
    const fila = document.createElement('tr');
    const columnaProducto = document.createElement('td');
    const columnaPrecio = document.createElement('td');
    const columnaCantidad = document.createElement('td');
    const columnaTotal = document.createElement('td');

    columnaProducto.innerText = item.nombre;
    columnaPrecio.innerText = item.precio;
    columnaCantidad.innerText = item.cantidad;
    columnaTotal.innerText = item.precio * item.cantidad;

    fila.appendChild(columnaProducto);
    fila.appendChild(columnaPrecio);
    fila.appendChild(columnaCantidad);
    fila.appendChild(columnaTotal);

    tablaCarrito.appendChild(fila);
  });

  // Actualizar el total del carrito
  const totalCarrito = document.getElementById('totalCarrito');
  const total = carrito.reduce((total, item) => total + (item.precio * item.cantidad), 0);
  totalCarrito.innerText = total.toFixed(2);
}

function comprar() {
  // Guardar el carrito en el almacenamiento local
  localStorage.setItem('carrito', JSON.stringify(carrito));

  // Redirigir a la página de resumen de compra
  window.location.href = 'resumen-compra.html';
}


// Obtener el carrito del almacenamiento global (si existe)
const carritoGuardado = localStorage.getItem('carrito');
if (carritoGuardado) {
  carrito = JSON.parse(carritoGuardado);
  mostrarCarrito();
}
