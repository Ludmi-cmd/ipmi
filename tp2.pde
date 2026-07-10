PImage imagen1, imagen2, imagen3, imagen4, imagen5, imagen6, imagen7;
PImage logo;
PFont fuente;

PImage imgParte2;
PImage imgSerie;

PImage icono1, icono2, icono3, icono4;

float posX1, posY1, vel1;
float posX2, posY2, vel2;
float posX3, posY3, vel3;
float posX4, posY4, vel4;
float posX5, posY5, vel5;
float posX6, posY6, vel6;
float posX7, posY7, vel7;
float posX8, posY8, vel8;
float posX9, posY9, vel9;
float posX10, posY10, vel10;

int pantalla = 0;
int tiempodeInicio;
int duraciondePantalla = 8000;

boolean presentacion = false;

String texto1 = "The Last of Us es un juego de accion y aventura que nos cuenta la vida de Joel y Ellie en medio de un apocalipsis. Fue creado por Naughty Dog y publicado por Sony Interactive Entertainment en 2013.";
String texto2 = "El juego transcurre en un mundo post-apocaliptico devastado por un hongo llamado Cordyceps que convierte humanos en zombies infectados.";
String texto3 = "Joel, un contrabandista endurecido por la muerte de su hija y la separacion con su hermano, debe escoltar a Ellie a traves de Estados Unidos en ruinas.";
String texto4 = "Ellie es una huerfana de 14 años inmune a la infeccion del hongo porque su madre fue mordida justo antes de dar a luz.";
String texto5 = "Las Luciernagas son un grupo rebelde que lucha contra FEDRA y buscan encontrar una cura utilizando la inmunidad de Ellie.";
String texto6 = "El juego combina sigilo, exploracion y combate. Tambien permite fabricar objetos utilizando recursos limitados.";
String texto7 = "Gracias al exito del juego, Naughty Dog lanzo una segunda parte y luego HBO estreno la serie en 2023.";

void setup() {
  size(640, 480);

  fuente = createFont("Georgia", 20, true);
  textFont(fuente);

  imagen1 = loadImage("thelastofus.jpg");
  imagen2 = loadImage("chasqueador.jpg");
  imagen3 = loadImage("joel.jpg");
  imagen4 = loadImage("ellie.jpg");
  imagen5 = loadImage("luciernagas.jpg");
  imagen6 = loadImage("joelyellie.jpg");
  imagen7 = loadImage("thelastofus.jpg");

  imgParte2 = loadImage("thelastofus2.jpg");
  imgSerie = loadImage("thelastofusserie.jpg");

  logo = loadImage("tlou.png");

  icono1 = loadImage("guitarra.png");
  icono2 = loadImage("luciernagas2.png");
  icono3 = loadImage("polilla.png");
  icono4 = loadImage("chasqueador2.png");

  tiempodeInicio = millis();

posX1 = random(width); posY1 = random(0, height); vel1 = random(1.5, 3.5);
  posX2 = random(width); posY2 = random(0, height); vel2 = random(1.5, 3.5);
  posX3 = random(width); posY3 = random(0, height); vel3 = random(1.5, 3.5);
  posX4 = random(width); posY4 = random(0, height); vel4 = random(1.5, 3.5);
  posX5 = random(width); posY5 = random(0, height); vel5 = random(1.5, 3.5);
  posX6 = random(width); posY6 = random(0, height); vel6 = random(1.5, 3.5);
  posX7 = random(width); posY7 = random(0, height); vel7 = random(1.5, 3.5);
  posX8 = random(width); posY8 = random(0, height); vel8 = random(1.5, 3.5);
  posX9 = random(width); posY9 = random(0, height); vel9 = random(1.5, 3.5);
  posX10 = random(width); posY10 = random(0, height); vel10 = random(1.5, 3.5);

}

void draw() {
  background(0);

 
  posY1 += vel1; if (posY1 > height) { posY1 = -40; posX1 = random(width); }
  image(icono1, posX1, posY1, 30, 30);

  posY2 += vel2; if (posY2 > height) { posY2 = -40; posX2 = random(width); }
  image(icono2, posX2, posY2, 30, 30);

  posY3 += vel3; if (posY3 > height) { posY3 = -40; posX3 = random(width); }
  image(icono3, posX3, posY3, 30, 30);

  posY4 += vel4; if (posY4 > height) { posY4 = -40; posX4 = random(width); }
  image(icono4, posX4, posY4, 30, 30);

  posY5 += vel5; if (posY5 > height) { posY5 = -40; posX5 = random(width); }
  image(icono1, posX5, posY5, 30, 30);

  posY6 += vel6; if (posY6 > height) { posY6 = -40; posX6 = random(width); }
  image(icono2, posX6, posY6, 30, 30);

  posY7 += vel7; if (posY7 > height) { posY7 = -40; posX7 = random(width); }
  image(icono3, posX7, posY7, 30, 30);

  posY8 += vel8; if (posY8 > height) { posY8 = -40; posX8 = random(width); }
  image(icono4, posX8, posY8, 30, 30);

  posY9 += vel9; if (posY9 > height) { posY9 = -40; posX9 = random(width); }
  image(icono1, posX9, posY9, 30, 30);

  posY10 += vel10; if (posY10 > height) { posY10 = -40; posX10 = random(width); }
  image(icono2, posX10, posY10, 30, 30);

 
  if (presentacion == false) {
    dibujarPantalladeInicio();
  } else if (pantalla < 7) {
    dibujarPantalla();
    verificarTiempo();
  } else {
    dibujarPantallaFinal();
  }
}

void dibujarPantalladeInicio() {
  if (imagen1 != null) {
    image(imagen1, 0, 0, 640, 480);
  }

  fill(255);
  textAlign(CENTER, CENTER);
  textSize(36);
  text("THE LAST OF US", 320, 160);

  textSize(18);
  fill(200);
  text("Una historia de supervivencia", 320, 210);

  dibujarBoton();
}

void dibujarPantalla() {
  
  if (pantalla == 0) image(imagen1, 30, 30, 300, 400);
  if (pantalla == 1) image(imagen2, 30, 30, 300, 400);
  if (pantalla == 2) image(imagen3, 30, 30, 300, 400);
  if (pantalla == 3) image(imagen4, 30, 30, 300, 400);
  if (pantalla == 4) image(imagen5, 30, 30, 300, 400);
  if (pantalla == 5) image(imagen6, 30, 30, 300, 400);
  

  if (pantalla == 6) {
    image(imgParte2, 30, 30, 180, 400);
    image(imgSerie, 230, 30, 180, 400);
  }

  textSize(18);
  textAlign(LEFT, TOP); 
  fill(255);

  
  if (pantalla == 0) text(texto1, 355, 140, 250, 240);
  if (pantalla == 1) text(texto2, 355, 140, 250, 240);
  if (pantalla == 2) text(texto3, 355, 140, 250, 240);
  if (pantalla == 3) text(texto4, 355, 140, 250, 240);
  if (pantalla == 4) text(texto5, 355, 140, 250, 240);
  if (pantalla == 5) text(texto6, 355, 140, 250, 240);
  
  if (pantalla == 6) {
    textSize(15);
    text(texto7, 435, 140, 180, 290);
  }

  
  dibujarIndicador();
  dibujarBarraProgreso();
}

void dibujarPantallaFinal() {
  if (imagen7 != null) {
    image(imagen7, 0, 0, 640, 480);
  }

  fill(255);
  textAlign(CENTER, CENTER);
  textSize(30);
  text("Juegazo", 320, 160);

  textSize(17);
  fill(200);
  text("The Last of Us", 320, 210);

  dibujarBoton();
}

void dibujarBoton() {
  boolean mouse = (mouseX >= 220 && mouseX <= 420 && mouseY >= 300 && mouseY <= 355);

  if (mouse) {
    fill(220, 30, 30);
  } else {
    fill(180, 0, 0);
  }

  noStroke();
  rect(220, 300, 200, 55, 10);

  fill(255);
  textAlign(CENTER, CENTER);
  textSize(20);

  if (presentacion == false) {
    text("INICIAR", 320, 325);
  } else if (pantalla >= 7) {
    text("REINICIAR", 320, 325);
  }
}

void dibujarIndicador() {
  int tamañodelpunto = 10;
  int separacion = 18;
  int posicionX = 320 - ((7 * separacion) / 2);

  for (int i = 0; i < 7; i++) {
    if (i == pantalla) {
      fill(255, 50, 50);
    } else {
      fill(150);
    }
    noStroke();
    ellipse(posicionX + i * separacion, 440, tamañodelpunto, tamañodelpunto);
  }
}

void dibujarBarraProgreso() {
  int tiempoTranscurrido = millis() - tiempodeInicio;
  float progreso = map(tiempoTranscurrido, 0, duraciondePantalla, 0, 640);

  if (progreso > 640) {
    progreso = 640;
  }

  fill(60);
  rect(0, 475, 640, 5);

  fill(180, 0, 0);
  rect(0, 475, progreso, 5);
}

void verificarTiempo() {
  int tiempoTranscurrido = millis() - tiempodeInicio;
  if (tiempoTranscurrido >= duraciondePantalla) {
    siguientePantalla();
  }
}

void siguientePantalla() {
  pantalla++;
  tiempodeInicio = millis();
}

void reiniciar() {
  pantalla = 0;
  presentacion = false;
  tiempodeInicio = millis();
}


void mouseClicked() {
  if (presentacion == false) {
    if (mouseX >= 220 && mouseX <= 420 && mouseY >= 300 && mouseY <= 350) {
      presentacion = true;
      pantalla = 0;
      tiempodeInicio = millis();
    }
  }

  if (pantalla >= 7) {
    if (mouseX >= 220 && mouseX <= 420 && mouseY >= 300 && mouseY <= 355) {
      reiniciar();
    }
  }
}
