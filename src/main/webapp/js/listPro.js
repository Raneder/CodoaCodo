// trae el modal con su sku eliminarModal

const eliminarModal = document.getElementById('eliminarModal')

// revisa si eliminarModal no es null 
if (eliminarModal) {
	// agrega un evento, ejecuta lo siguiente cuando el modal se muestra
  eliminarModal.addEventListener('show.bs.modal', event => {
    // trae el elemento que ejecuto el modal 
    const a = event.relatedTarget
    
    // trae el atributo del link a
    const Sku = a.getAttribute('Sku')
    
    const descripcion = a.getAttribute("descripcion")
    
    const inputSku = eliminarModal.querySelector("#sku")
    inputSku.value= Sku
    
    const divDataProducto = eliminarModal.querySelector('#dataProducto')

   
    divDataProducto.innerHTML = descripcion
  })
}