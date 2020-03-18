function validaCampos(){

    var nombre = $("#nombre").val();
    var edad = $("#edad").val();
    var direccion = $("#direccion").val();
    //validamos campos
    if($.trim(nombre) == ""){
    toastr.error("No ha ingresado Nombre","Aviso!");
        return false;
    }
                       if($.trim(edad) == ""){
    toastr.error("No ha ingresado Edad","Aviso!");
        return false;
    }
    
                if(edad < 0){
    toastr.error("Mínimo permitido 0","Aviso!");
        return false;
    }
    if($.trim(direccion) == ""){
    toastr.error("No ha ingresado Dirección","Aviso!");
        return false;
    }
    
    }