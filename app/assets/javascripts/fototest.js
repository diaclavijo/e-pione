
var cartas1 = coche1 = pera1 = trompeta1 = zapatos1 = cuchara1 = 0; // Inicializando todas las variables de las fotos. El nombre es de la la foto correspondiente,
var cartas2 = coche2 = pera2 = trompeta2 = zapatos2 = cuchara2 = 0; // y se le añade 1, 2 ó 3 al nombre según sea la misma foto en la fase de denominación (fase 1),
var cartas3 = coche3 = pera3 = trompeta3 = zapatos3 = cuchara3 = 0; // en la de recuerdo libre (fase 2) o en la de recuerdo facilitado (fase 3).
var sonHombres = sonMujeres = 0; // variable que informa de si se está activamente en la fase de fluidez hombres o en la de fluidez mujeres
var totalDenom = totalLibre = totalFacil = totalHombres = totalMujeres = 0; // variables de los subtotales de cada columna de las fases del test
var fase = "ninguna"; // valor inicial de la fase
var temporizador = 0; // valor inicial del temporizador
var puntos = 0; // puntos iniciales

$(document).ready(function(){ // pone a cero todos los valores en las casillas de la tabla de realización del test
  $('#form1')[0].reset();
  $("#Reset").click(function(){
    $("#Resultado").html("0");

    $("#ca1").html("0");
    $("#ca2").html("0");
    $("#ca3").html("0");

    $("#co1").html("0");
    $("#co2").html("0");
    $("#co3").html("0");

    $("#pe1").html("0");
    $("#pe2").html("0");
    $("#pe3").html("0");

    $("#tr1").html("0");
    $("#tr2").html("0");
    $("#tr3").html("0");

    $("#za1").html("0");
    $("#za2").html("0");
    $("#za3").html("0");

    $("#cu1").html("0");
    $("#cu2").html("0");
    $("#cu3").html("0");

    $("#totalDenom").html("0");
    $("#totalLibre").html("0");
    $("#totalFacil").html("0");

    $("#totalHombres").html("0");
    $("#totalMujeres").html("0");

    $("#iniciaHombres").prop('checked',false);
    $("#iniciaMujeres").prop('checked',false);

    $("#countdown_text").html("30");
  });

  $("map").click(function(){        // Va actualizando los valores de cada casilla de denominación a medida que avanza el test,
    $("#Resultado").html(puntos);   // incluyendo el subtotal de denominación y el total global

    $("#ca1").html(cartas1);
    $("#co1").html(coche1);
    $("#pe1").html(pera1);
    $("#tr1").html(trompeta1);
    $("#za1").html(zapatos1);
    $("#cu1").html(cuchara1);

    $("#totalDenom").html(totalDenom);
  });

  $("table").click(function(){  // Va actualizando los valores de cada casilla de la tabla a medida que avanza el test, incluyendo subtotales y total global
    $("#Resultado").html(puntos);

    $("#ca1").html(cartas1);
    $("#ca2").html(cartas2);
    $("#ca3").html(cartas3);

    $("#co1").html(coche1);
    $("#co2").html(coche2);
    $("#co3").html(coche3);

    $("#pe1").html(pera1);
    $("#pe2").html(pera2);
    $("#pe3").html(pera3);

    $("#tr1").html(trompeta1);
    $("#tr2").html(trompeta2);
    $("#tr3").html(trompeta3);

    $("#za1").html(zapatos1);
    $("#za2").html(zapatos2);
    $("#za3").html(zapatos3);

    $("#cu1").html(cuchara1);
    $("#cu2").html(cuchara2);
    $("#cu3").html(cuchara3);

    $("#totalDenom").html(totalDenom);
    $("#totalLibre").html(totalLibre);
    $("#totalFacil").html(totalFacil);
  });

  $("#iniciaHombres").click(function(){     // Desactiva el temporizador al activar el botón de radio del fluidez hombres
    temporizador = 0;
    $('#fototest_total_hombres_set').val('1')
  });

  $("#iniciaMujeres").click(function(){     // Desactiva el temporizador al activar el botón de radio del fluidez mujeres
    temporizador = 0;
    $('#fototest_total_mujeres_set').val('1')
  });

  $("#hombresInc").click(function(){        // Actualiza en la tabla el subtotal de nombres de hombre y el total general
    $("#totalHombres").html(totalHombres);  // a medida que se van añadiendo nombres
    $("#Resultado").html(puntos);
  });

  $("#mujeresInc").click(function(){        // Actualiza en la tabla el subtotal de nombres de mujer y el total general
    $("#totalMujeres").html(totalMujeres);  // a medida que se van añadiendo nombres
    $("#Resultado").html(puntos);
  });

  $("#hombresDec").click(function(){        // Actualiza en la tabla el subtotal de nombres de hombre y el total general
    $("#totalHombres").html(totalHombres);  // a medida que se van restando nombres para corregir añadidos por error
    $("#Resultado").html(puntos);
  });

  $("#mujeresDec").click(function(){        // Actualiza en la tabla el subtotal de nombres de mujer y el total general
    $("#totalMujeres").html(totalMujeres);  // a medida que se van restando nombres para corregir añadidos por error
    $("#Resultado").html(puntos);
  });

  $("button").click(function(){  // Conmutador que oculta o muestra la lámina al sujeto
    $(".lamina").toggle();
  });
});

function SumaAciertoCartas (fase) {  // En esta y en las siguientes 5 funciones se actualizan los valores de cada foto según
  switch (fase) {                  // la fase en que se encuentran la parte de las fotos: denominación (1), recuerdo libre (2)
    case "denom" :               // o recuerdo facilitado (3), actualizando al mismo tiempo las variables de los subtotales y del total
      if (cartas1 >= 1) {
        cartas1 -= 1;        // En la fase 1 (denominación), 1 punto por acierto (o 1 punto menos si dimos un positivo por error)
        totalDenom -= 1;
        puntos -= 1;
      }
      else{
        cartas1 += 1;
        totalDenom += 1;
        puntos += 1;
      }
      break;
    case "libre" :
      if (cartas2 >= 2) {      // En la fase 2 (recuerdo libre), 2 puntos por acierto (o 2 puntos menos si dimos un positivo por error)
        cartas2 -= 2;
        totalLibre -= 2;
        puntos -= 2;
      }
      else{
        cartas2 += 2;
        totalLibre += 2;
        puntos += 2;
      }
      break;
    case "facil" :
      if (cartas3 >= 1 || cartas2 >= 2) {      // En la fase 3 (recuerdo facilitado), 1 punto por acierto (o 1 punto menos si dimos un positivo por error)
        if (cartas3 >= 1) {                  // pero solo podemos añadir un punto para las fotos en las que no acertó en la fase anterior (aquellas en las
          cartas3 -= 1;                        // que NO ha conseguido los dos puntos del recuerdo libre). Los ítems acertados en el recuerdo libre NO se
          totalFacil -= 1;                     // puntúan en esta fase de recuerdo facilitado
          puntos -= 1;
        }
      }
      else{
        cartas3 += 1;
        totalFacil += 1;
        puntos += 1;
      }
      break;
  }
}

function SumaAciertoCoche (fase) {
  switch (fase) {
    case "denom" :
      if (coche1 >= 1) {
        coche1 -= 1;
        totalDenom -= 1;
        puntos -= 1;
      }
      else{
        coche1 += 1;
        totalDenom += 1;
        puntos += 1;
      }
      break;
    case "libre" :
      if (coche2 >= 2) {
        coche2 -= 2;
        totalLibre -= 2;
        puntos -= 2;
      }
      else{
        coche2 += 2;
        totalLibre += 2;
        puntos += 2;
      }
      break;
    case "facil" :
      if (coche3 >= 1 || coche2 >= 2) {
        if (coche3 >= 1) {
          coche3 -= 1;
          totalFacil -= 1;
          puntos -= 1;
        }
      }
      else{
        coche3 += 1;
        totalFacil += 1;
        puntos += 1;
      }
      break;
  }
}

function SumaAciertoPera (fase) {
  switch (fase) {
    case "denom" :
      if (pera1 >= 1) {
        pera1 -= 1;
        totalDenom -= 1;
        puntos -= 1;
      }
      else{
        pera1 += 1;
        totalDenom += 1;
        puntos += 1;
      }
      break;
    case "libre" :
      if (pera2 >= 2) {
        pera2 -= 2;
        totalLibre -= 2;
        puntos -= 2;
      }
      else{
        pera2 += 2;
        totalLibre += 2;
        puntos += 2;
      }
      break;
    case "facil" :
      if (pera3 >= 1 || pera2 >= 2) {
        if (pera3 >= 1) {
          pera3 -= 1;
          totalFacil -= 1;
          puntos -= 1;
        }
      }
      else{
        pera3 += 1;
        totalFacil += 1;
        puntos += 1;
      }
      break;
  }
}

function SumaAciertoTrompeta (fase) {
  switch (fase) {
    case "denom" :
      if (trompeta1 >= 1) {
        trompeta1 -= 1;
        totalDenom -= 1;
        puntos -= 1;
      }
      else{
        trompeta1 += 1;
        totalDenom += 1;
        puntos += 1;
      }
      break;
    case "libre" :
      if (trompeta2 >= 2) {
        trompeta2 -= 2;
        totalLibre -= 2;
        puntos -= 2;
      }
      else{
        trompeta2 += 2;
        totalLibre += 2;
        puntos += 2;
      }
      break;
    case "facil" :
      if (trompeta3 >= 1 || trompeta2 >= 2) {
        if (trompeta3 >= 1) {
          trompeta3 -= 1;
          totalFacil -= 1;
          puntos -= 1;
        }
      }
      else{
        trompeta3 += 1;
        totalFacil += 1;
        puntos += 1;
      }
      break;
  }
}

function SumaAciertoZapatos (fase) {
  switch (fase) {
    case "denom" :
      if (zapatos1 >= 1) {
        zapatos1 -= 1;
        totalDenom -= 1;
        puntos -= 1;
      }
      else{
        zapatos1 += 1;
        totalDenom += 1;
        puntos += 1;
      }
      break;
    case "libre" :
      if (zapatos2 >= 2) {
        zapatos2 -= 2;
        totalLibre -= 2;
        puntos -= 2;
      }
      else{
        zapatos2 += 2;
        totalLibre += 2;
        puntos += 2;
      }
      break;
    case "facil" :
      if (zapatos3 >= 1 || zapatos2 >= 2) {
        if (zapatos3 >= 1) {
          zapatos3 -= 1;
          totalFacil -= 1;
          puntos -= 1;
        }
      }
      else{
        zapatos3 += 1;
        totalFacil += 1;
        puntos += 1;
      }
      break;
  }
}

function SumaAciertoCuchara (fase) {
  switch (fase) {
    case "denom" :
      if (cuchara1 >= 1) {
        cuchara1 -= 1;
        totalDenom -= 1;
        puntos -= 1;
      }
      else{
        cuchara1 += 1;
        totalDenom += 1;
        puntos += 1;
      }
      break;
    case "libre" :
      if (cuchara2 >= 2) {
        cuchara2 -= 2;
        totalLibre -= 2;
        puntos -= 2;
      }
      else{
        cuchara2 += 2;
        totalLibre += 2;
        puntos += 2;
      }
      break;
    case "facil" :
      if (cuchara3 >= 1 || cuchara2 >= 2) {
        if (cuchara3 >= 1) {
          cuchara3 -= 1;
          totalFacil -= 1;
          puntos -= 1;
        }
      }
      else{
        cuchara3 += 1;
        totalFacil += 1;
        puntos += 1;
      }
      break;
  }
}


function incHombres() {                                                                     // Pone en blanco el botón de radio correspondiente a "Fluidez Hombres",
  if ((document.getElementById("iniciaHombres").checked == true) && (sonHombres == 1)) {  // activa el temporizador (solo si no está ya activado antes) y va añadiendo
    temporizador = 1;                                                                     // aciertos de nombres de hombre mientras el contador no llegue a cero
    if (countdown_number != 0) {
      totalHombres += 1;
      puntos += 1;
    }
  }
}

function incMujeres() {
  if ((document.getElementById("iniciaMujeres").checked == true) && (sonMujeres == 1))	{  // Como el anterior, pero incrementando nombres de mujeres
    temporizador = 1;
    if (countdown_number != 0) {
      totalMujeres +=1;
      puntos += 1;
    }
  }
}

function decHombres() {
  if ((document.getElementById("iniciaHombres").checked == true) && (sonHombres == 1))	{  // Como el anterior, pero decrementando nombres de hombres
    if (totalHombres != 0) {
      if (countdown_number != 0) {
        totalHombres -= 1;
        puntos -= 1;
      }
    }
  }
}

function decMujeres() {
  if ((document.getElementById("iniciaMujeres").checked == true) && (sonMujeres == 1))	{  // Como el anterior, pero decrementando nombres de mujeres
    if (totalMujeres != 0) {
      if (countdown_number != 0) {
        totalMujeres -= 1;
        puntos -= 1;
      }
    }
  }
}

function hombres2str() {                     // hace que la cadena con el número de nombres de hombres tenga siempre 2 dígitos, antes de enviarla a la página de proceso de datos
  if (totalHombres < 10) {
    totalHombres = " " + totalHombres;
  }
  else {
    totalHombres = "" + totalHombres;
  }
}

function mujeres2str() {                     // como el anterior, pero para mujeres
  if (totalMujeres < 10) {
    totalMujeres = " " + totalMujeres;
  }
  else {
    totalMujeres = "" + totalMujeres;
  }
}

var countdown;
var countdown_number;

function countdown_init() {  // inicializa el temporizador decreciente
  if (((document.getElementById("iniciaHombres").checked == true) && (sonHombres == 1)) || ((document.getElementById("iniciaMujeres").checked == true)) && (sonMujeres == 1)) {
    if (temporizador == 0) {
      countdown_number = 31;
      countdown_trigger();
    }
  }
}

function countdown_trigger() {  // pone en marcha el temporizador decreciente y lo para cuando llega a cero
  if(countdown_number > 0) {
    countdown_number--;
    document.getElementById('countdown_text').innerHTML = countdown_number;
    if(countdown_number > 0) {
      countdown = setTimeout('countdown_trigger()', 1000);
    }
  }
}
function clearText(thefield){                  // limpia el campo de fecha o de edad cuando toma el foco
  if (thefield.defaultValue == thefield.value)
    thefield.value = ""
}
