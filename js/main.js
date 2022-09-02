/**
 * Funcion para validar si el dato a evaluar es mayor a 0 y si este es un valor valido.
 */
function validarSigno(){
    if(numero.value <= 0 || numero.value == ''){
        alert('El numero diligenciado debe ser superior a 0.');
        numero.value = '';
    }
}

/**
 * Funcion para limpiar los campos de ingresar datos y mostrar respuesta
 */
function limpiar(){
    numero.value = '';
    respuesta.value = '';   
}

/**
 * Funcion para calcular el resultado del valor ingresado, en caso de ser 1 se evalua el factorial y se muestra, 
 * en caso de ser 2 se evaluan las potencias del numero de 1 a 10 y se muestra
 */
function calcular(){
    var desition = calculo.value;
    var numb = numero.value;
    var fact = 1;
    var pow = '';
    var result = document.getElementById("respuesta")
    if(numb != ''){
        if(desition == 1){
            for (var i = 1; i <= numb; i++){
                fact *= i;
            }
            respuesta.value = fact;
        }else{
            for (var i = 1; i < 11; i++){
                pow = pow +"\r\n"+ numb+'^'+ i +': '+ numb**i;
            }
            respuesta.value = pow.trim();
        }
    }else{
        alert('Ingrese un valor valido.');
    }
}