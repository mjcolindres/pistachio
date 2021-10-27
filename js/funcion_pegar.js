window.onload = function() {
    var myInput = document.getElementById('txt_nombre_empresa');
    var myInput2 = document.getElementById('txt_contacto_tel');
    var myInput3 = document.getElementById('txt_contacto_nombre');
    var myInput4 = document.getElementById('txt_contacto_otro');
    //txt_nombre_empresa
    myInput.onpaste = function(e) {
      e.preventDefault();
      swal('Acción no permitida', '', 'warning');
    }
    
    myInput.oncopy = function(e) {
      e.preventDefault();
      swal('Acción no permitida', '', 'warning');
    }
//txt_contacto_tel
    myInput2.onpaste = function(e) {
        e.preventDefault();
        swal('Acción no permitida', '', 'warning');
      }
      
      myInput2.oncopy = function(e) {
        e.preventDefault();
        swal('Acción no permitida', '', 'warning');
      }

      //txt_contacto_nombre
    myInput3.onpaste = function(e) {
        e.preventDefault();
        swal('Acción no permitida', '', 'warning');
      }
      
      myInput3.oncopy = function(e) {
        e.preventDefault();
        swal('Acción no permitida', '', 'warning');
      }
         //txt_contacto_otro
  myInput4.onpaste = function(e) {
    e.preventDefault();
    swal('Acción no permitida', '', 'warning');
  }
  
  myInput4.oncopy = function(e) {
    e.preventDefault();
    swal('Acción no permitida', '', 'warning');
  }
  }

