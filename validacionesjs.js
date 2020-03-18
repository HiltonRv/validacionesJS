function validaVacio(valor) {
    valor = valor.replace("&nbsp;", "");
    valor = valor == undefined ? "" : valor;
    if (!valor || 0 === valor.trim().length) {
        return true;
        }
    else {
        return false;
        }
    }

function validarfor(){

var correo = document.getElementById("mail").value; 
var nom = document.getElementsByName("nombres")[0].value;
var rs = document.getElementsByName("razonsocial")[0].value;
var tel = document.getElementsByName("telefono")[0].value;
var cel = document.getElementsByName("celular")[0].value;
var coment = document.getElementsByName("comentarios")[0].value;

var expr = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;


if ( !expr.test(correo) ){                                                            //COMPRUEBA MAIL
    alert("Error: La dirección de correo " + correo + " es incorrecta.");
    return false;
}

if ( validaVacio(correo.value) || validaVacio(nom.value) || validaVacio(rs.value) || validaVacio(tel.value) || validaVacio(cel.value) || validaVacio(coment.value)) {  //COMPRUEBA CAMPOS VACIOS
    alert("Los campos no pueden quedar vacios");
    return false;
}
return true;
}