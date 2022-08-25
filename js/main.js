function validarSigno(){
    if(numero.value <= 0 || numero.value == ''){
        alert('El numero diligenciado debe ser superior a 0.');
        numero.value = '';
    }
}

function limpiar(){
    numero.value = '';
    respuesta.value = '';   
}

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