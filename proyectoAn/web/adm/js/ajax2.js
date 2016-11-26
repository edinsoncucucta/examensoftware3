/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
 


function espera(){
       location.href = "Datos_empleado.jsp";
           
           
}
function Ingresarempleado() { 

   
    var name = document.getElementById('name').value;
   
    var apell= document.getElementById('apell').value;
    var cedula= document.getElementById('cedula').value;
    var cont = document.getElementById('cont').value;
    var email = document.getElementById('email').value;
    var tel = document.getElementById('tel').value;
    var cargo = document.getElementById('cargo').value;
    
    var xhttp = new XMLHttpRequest();
    var msg = "";
     
     if (name===""){ 
      	 toastr.options = {
                    "closeButton": false,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": false,
                    "positionClass": "toast-bottom-full-width",
                    "preventDuplicates": false,
                    "onclick": null,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "5000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                };
                toastr.warning("Error campo Nombre incompleto", "Ooops!");
      	return 0; 
       }
       if (apell===""){ 
      	 toastr.options = {
                    "closeButton": false,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": false,
                    "positionClass": "toast-bottom-full-width",
                    "preventDuplicates": false,
                    "onclick": null,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "5000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                };
                toastr.warning("Error campo apellido incompleto", "Ooops!");
      	return 0; 
         
   	 
   	} 
        if (cont===""){ 
      	 toastr.options = {
                    "closeButton": false,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": false,
                    "positionClass": "toast-bottom-full-width",
                    "preventDuplicates": false,
                    "onclick": null,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "5000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                };
                toastr.warning("Error ingrese una contraseña para poder entrar al sistema", "Ooops!");
      	return 0; }
    if (email===""){ 
      	 toastr.options = {
                    "closeButton": false,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": false,
                    "positionClass": "toast-bottom-full-width",
                    "preventDuplicates": false,
                    "onclick": null,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "5000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                };
                toastr.warning("Ingrese algo en el campo email", "Ooops!");
      	return 0; }
    if (cargo==="0"){ 
      	 toastr.options = {
                    "closeButton": false,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": false,
                    "positionClass": "toast-bottom-full-width",
                    "preventDuplicates": false,
                    "onclick": null,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "5000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                };
                toastr.warning("Seleccione el cargo del empleado", "Ooops!");
      	return 0; }
    else{
     
     
    xhttp.onreadystatechange = function () {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            if (xhttp.responseText.indexOf('error') > -1) {
                msg = "error";
                $.unblockUI();
                var sub = xhttp.responseText;
                toastr.options = {
                    "closeButton": false,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": false,
                    "positionClass": "toast-bottom-full-width",
                    "preventDuplicates": false,
                    "onclick": null,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "5000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                };
                toastr.error(sub, "Ooops!");
                //esto es lo q sale en rojo
            } else {
                $.unblockUI();
                var sub = xhttp.responseText;
                toastr.options = {
                    "closeButton": false,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": true,
                    "positionClass":  "toast-bottom-full-width",
                    "preventDuplicates": false,
                    "onclick": null,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "5000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                };
                toastr.success(sub, "Ooops!");
                //esto es lo q sale en rojo
               // document.getElementById('algo').innerHTML = sub;
                setTimeout("espera()",900);
              
          
        }
    }
    };

    $.blockUI({
        message: 'Registrando Empleado',
        css: {
            border: 'none',
            padding: '25px',
            backgroundColor: '#000',
            '-webkit-border-radius': '10px',
            '-moz-border-radius': '10px',
            opacity: .5,
            color: '#fff'
        }});
    var text = "registradoempleado.jsp?name="+name+"&apell="+apell+"&cedula="+cedula+"&cont="+cont+"&email="+email+"&tel="+tel+"&cargo="+cargo;
    xhttp.open("post", text, true); 
    xhttp.send();
}
}
