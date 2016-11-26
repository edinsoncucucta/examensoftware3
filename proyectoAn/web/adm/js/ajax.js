function consultarPreconteo() { 

    var hab = document.getElementById('hab').value;
    var emp = document.getElementById('emp').value;
    var xhttp = new XMLHttpRequest();
    var msg = "";
   
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
        message: 'Asignando',
        css: {
            border: 'none',
            padding: '25px',
            backgroundColor: '#000',
            '-webkit-border-radius': '10px',
            '-moz-border-radius': '10px',
            opacity: .5,
            color: '#fff'
        }});
    var text = "ingresaraseo.jsp?hab=" + hab+ "&emp=" + emp;
    xhttp.open("post", text, true); 
    xhttp.send();
}
function espera(){
      javascript:location.reload();
           
}
