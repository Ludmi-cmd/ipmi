PImage[] imagenes;
PImage logo;
PFont fuente;
PImage imgParte2;
PImage  imgSerie;
PImage[] iconosFondo = new PImage[4];
int cantidadpos = 30; 
float[]  posX = new float[cantidadpos];
float[] posY = new float[cantidadpos];
float[] velocidades = new float[cantidadpos];

int[] tipoIcono = new int[cantidadpos];
int pantalla = 0;       
int totalPantallas = 7;
int tiempoInicio;       
int duracionPantalla = 8000; 

boolean presentacionActiva = false;

String [] textos = {
  "The Last of Us es un juego de accion y aventura que nos cuenta la vida de joel y ellie en medio de un apocalípsis. fue creado por Naughty Dog y publicado por Sony Interactive\nEntertainment en 2013.",
  "El juego transcurre en un\nmundo post-apocalíptico\ndevastado por un hongo llamado Cordyceps\nque convierte humanos\nen zombies infectados.",
  "Joel, un contrabandista\nendurecido por la muerte de su hija y la separacion con su hermano debe escoltar a Ellie a través de Estados Unidos en ruinas. donde un grupo llamado las luciernagas la sigue por su inmunidad.",
  "Ellie, una huerfana de 14 años inmune a la infeccion del hongo porque su madre fue mordida justo al dar a luz es rescadata por Marlene de las luciernagas y llevada a joel para que la protega y la cuide.",
  "Las luciernagas, es un grupo de rebeles que pelea contra la opresion militar de FEDRA \n buscando restaurar la democracia y la libertad\n de los civiles. Pero para conseguir eso necesitaban a ellie y experimentar con su cerebro para buscar una cura.",
  "El juego combina sigilo,\nexploración y combate\npara sobrevivir en un\nmundo hostil y peligroso.\nDeberás recolectar\nsuministros para fabricar\nbotiquines, dagas y armas\ncon recursos muy limitados \nmientras zombies y personas peligras se persiguen.",
  "Gracias a que el juego gano muchos premios en el 2020 la empresa de Naughty Dog decidio sacar la segunda parte\n y a principios de 2023 sacaron una serie en HBO."
};

String []archivosImagenes = {
  "thelastofus.jpg",
  "chasqueador.jpg",
  "joel.jpg",
  "ellie.jpg",
  "luciernagas.jpg",
  "joelyellie.jpg",
   "thelastofus.jpg",
  "thelastofus2.jpg", "thelastofusserie.jpg"
};

void setup() {
  size(640, 480);
  
  fuente = createFont("Georgia", 20, true);
  textFont(fuente);

  imagenes = new PImage [totalPantallas];
  for (int i = 0; i < totalPantallas; i ++) {
    imagenes [i] = loadImage(archivosImagenes [i]);
  }
  
  logo = loadImage("tlou.png");
  tiempoInicio = millis();
  
  iconosFondo[0] = loadImage("guitarra.png");
  iconosFondo[1] = loadImage("luciernagas2.png");
  iconosFondo[2] = loadImage("polilla.png");
  iconosFondo[3] = loadImage("chasqueador2.png");
  
  for (int i = 0; i < cantidadpos; i++) {
    posX[i] = random(width);
    posY[i] = random(-height, 0); 
    velocidades[i] = random(1.5, 3.5);  
    tipoIcono[i] = int(random(4));       
  }
  

PImage imgParte2 = loadImage("thelastofus2.jpg");
 PImage imgSerie = loadImage("thelastofusserie.jpg");
 
}
void draw() {
  background(0);
for (int i = 0; i < cantidadpos; i++) {
    posY[i] += velocidades[i];
    
    if (posY[i] > height) {
      posY[i] = -40;
      posX[i] = random(width);
    }
      if (iconosFondo[tipoIcono[i]] != null) {
      tint(255, 140); 
      image(iconosFondo[tipoIcono[i]], posX[i], posY[i], 30, 30);
      noTint(); 
    }
  }
  
  if (presentacionActiva == false) {
    dibujarPantallaInicio();
  } else if (pantalla < totalPantallas) {
    dibujarPantalla();  
    verificarTiempo();
  } else {
    dibujarPantallaFinal();
  }
}   
 
void dibujarPantallaInicio() {
  if (imagenes[0] != null) {
    tint(255, 120); 
    image(imagenes[0], 0, 0, 640, 480);
    noTint();
  }

  fill(255);
  textAlign(CENTER, CENTER);
  textSize(36);
  text("THE LAST OF US", 320, 160);

  textSize(18);
  fill(200, 200, 200);
  text("Una historia de supervivencia", 320, 210);

  dibujarBoton(220, 300, 200, 50, "INICIAR", color(180, 0, 0), color(255));
}


void dibujarPantalla() {
  
  float efectoFlotando = sin(frameCount * 0.02) * 8;
  int tiempoTranscurrido = millis() - tiempoInicio;
  

  float animacionEntrada = map(tiempoTranscurrido, 0, 800, -150, 0); 
  if (animacionEntrada > 0) {
   animacionEntrada = 0; 
  }
  
  if (pantalla == 6) {
    
    if (imgParte2 == null) { imgParte2 = loadImage("thelastofus2.jpg"); }
    if (imgSerie == null) { imgSerie = loadImage("thelastofusserie.jpg"); }
    
    if (imgParte2 != null) {
      image(imgParte2, 25 +animacionEntrada, 50 + efectoFlotando, 180, 240);
    }
    if (imgSerie != null) {
      image(imgSerie, 435 - animacionEntrada, 50 + efectoFlotando, 180, 240); 
    }
    fill(255);
    noStroke();
    rect(215, 50, 210, 180, 15);
  
  } else {
  
    {
    image(imagenes[pantalla], 30 + animacionEntrada, 30 + efectoFlotando, 300, 400);
        }
  
   if (pantalla == 0 && logo != null) {
    float logoX = 50 + animacionEntrada;
    float logoY = 190 + efectoFlotando; 
    image(logo, logoX, logoY, 300, 100);
  }
  fill(255);
  noStroke();
  rect(340, 120, 280, 280, 15);
  }
  float offsetY = sin(frameCount * 0.03) * 4; 
  fill(0);
  textAlign(LEFT, TOP);
  textSize(18);
  
  int textoActual = pantalla;
  if (textoActual >= textos.length) {
    textoActual = textos.length - 1;
  }
  
  if (pantalla == 6) {
    textSize(15); 
    text(textos[textoActual], 230, 70 + offsetY, 180, 290); 
    
  } else {
    
    textSize(18);
    text(textos[textoActual], 355, 140 + offsetY, 250, 240);
  text(textos[textoActual], 355, 140 + offsetY, 250, 240);
  }
  dibujarIndicador();
  dibujarBarraProgreso(tiempoTranscurrido);
  }

void dibujarPantallaFinal() {
  if (imagenes[totalPantallas - 1] == null) {
    
  } else {
    
    tint(255, 80);
    image(imagenes[totalPantallas - 1], 0, 0, 640, 480);
    noTint();
  }

  fill(255);
  textAlign(CENTER, CENTER);
  textSize(30);
  text("Juegazo", 320, 160);

  textSize(17);
  fill(200, 200, 200);
  text("The Last of Us", 320, 210);

  dibujarBoton(220, 300, 200, 55, "REINICIAR", color(180, 0, 0), color(255));
}

void dibujarBoton(int x, int y, int w, int h, String etiqueta, color colorFondo, color colorTexto) {
  boolean hover = (mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h);

  if (hover) {
    fill(220, 30, 30);
  } else {
    fill(colorFondo);
  }

  noStroke();
  rect(x, y, w, h, 10);

  fill(colorTexto);
  textAlign(CENTER, CENTER);
  textSize(20);
  text(etiqueta, x + w / 2, y + h / 2);
}


void dibujarIndicador() {
  int dotSize = 10;
  int separacion = 18;
  int startX = 320 - ((totalPantallas * separacion) / 2);

  for (int i = 0; i < totalPantallas; i++) {
    if (i == pantalla) {
      fill(255, 50, 50);
    } else {
      fill(150);
    }
    noStroke();
    ellipse(startX + i * separacion, 440, dotSize, dotSize);
  }
}

void dibujarBarraProgreso(int tiempoTranscurrido) {
  float progreso = map(tiempoTranscurrido, 0, duracionPantalla, 0, 640);
  if (progreso > 640) {
    progreso = 640; 
  }

  fill(60);
  rect(0, 475, 640, 5);

  fill(180, 0, 0);
  rect(0, 475, progreso, 5);
}


void verificarTiempo() {
  int tiempoTranscurrido = millis() - tiempoInicio;

  if (tiempoTranscurrido >= duracionPantalla) {
    siguientePantalla();
  }
}

void siguientePantalla() {
  pantalla++;
  tiempoInicio = millis();
}

void reiniciar() {
  pantalla = 0;
  presentacionActiva = false;
  tiempoInicio = millis();
}

void mouseClicked() {
  if (presentacionActiva == false) {
    if (mouseX >= 220 && mouseX <= 420 && mouseY >= 300 && mouseY <= 350) {
      presentacionActiva = true;
      pantalla = 0;
      tiempoInicio = millis();
    }
  }

  if (pantalla >= totalPantallas) {
    if (mouseX >= 220 && mouseX <= 420 && mouseY >= 300 && mouseY <= 355) {
      reiniciar();
    }
  }
}
