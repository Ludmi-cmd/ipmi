//https://youtu.be/uMg6K9pRiSk

PImage foto;

int Color = 0;


void setup() {
  size(800, 400);
  foto = loadImage("circulos.jpg");
  noStroke();
}

void draw() {

  background(29, 129, 219);
  image(foto, 0, 0, 400, 400);

  
    for (int y=0; y<height; y+=16) {

      if (Color == 0) {
//verde, rojo y azul
        fill(85, 242, 22);
        rect(400, y, width, 5);

        fill(223, 15, 8);
        rect(400, y+5, width, 9);

        fill(29, 129, 219);
        rect(400, y+10, width, 6);
        
       

      } else if (Color == 1) {
//mismo colores pero invertidos
        fill(29, 129, 219);
        rect(400, y, width, 5);

        fill(223, 15, 8);
        rect(400, y+5, width, 9);

        fill(85, 242, 22);
        rect(400, y+10, width, 6);

      } else if (Color == 2) {
//amarillo, magenta y celeste
        fill(255, 255, 0);
        rect(400, y, width, 5);

        fill(255, 0, 255);
        rect(400, y+5, width, 9);

        fill(0, 255, 255);
        rect(400, y+10, width, 6);

      } else {
//violeta, naranja y blanco
        fill(255, 128, 0);
        rect(400, y, width, 5);

        fill(128, 0, 255);
        rect(400, y+5, width, 9);

        fill(255);
        rect(400, y+10, width, 6);
      }
    }
  

  dibujarCirculo(740, 60);
  dibujarCirculo(582, 73);
  dibujarCirculo(464, 70);

  dibujarCirculo(440, 152);
  dibujarCirculo(460, 238);
  dibujarCirculo(554, 204);

  dibujarCirculo(440, 323);
  dibujarCirculo(522, 347);
  dibujarCirculo(640, 277);
  
  dibujarCirculo (741,331);
  dibujarCirculo (799,178);
  
 
  color Verde, Rojo, Azul;
  if (Color == 0) {
    Verde = color(85, 242, 22); Rojo = color(223, 15, 8); Azul = color(29, 129, 219);
  } else if (Color == 1) {
    Verde = color(85, 242, 22); Rojo = color(223, 15, 8); Azul = color(29, 129, 219);
  } else if (Color == 2) {
    Verde = color(255, 255, 0); Rojo = color(255, 0, 255); Azul = color(0, 255, 255);
  } else {
    Verde = color(255, 128, 0); Rojo = color(128, 0, 255); Azul = color(255);
  }


  for (int y = 0; y < height; y += 16) {
    int V = y;
    int R = y + 5;
    int A = y + 10;


    for (int x = 400; x < width; x++) {
      
      // CIRCULOS AZULES 
      if (dist(x, A + 3, 740, 60)  < calcularTam(740, 60)/2)  { fill(Azul); rect(x, A, 1, 5); }
      if (dist(x, A + 3, 440, 152) < calcularTam(440, 152)/2) { fill(Azul); rect(x, A, 1, 5); }
      if (dist(x, A + 3, 440, 323) < calcularTam(440, 323)/2) { fill(Azul); rect(x, A, 1, 5); }
      if (dist(x, A + 3, 741, 331) < calcularTam(741, 331)/2) { fill(Azul); rect(x, A, 1, 5); }
   
      // CIRCULOS ROJOS 
      if (dist(x, R + 4.5, 582, 73)  < calcularTam(582, 73)/2)  { fill(Rojo); rect(x, R, 1, 5); }
      if (dist(x, R + 4.5, 460, 238) < calcularTam(460, 238)/2) { fill(Rojo); rect(x, R, 1, 5); }
      if (dist(x, R + 4.5, 640, 277) < calcularTam(640, 277)/2) { fill(Rojo); rect(x, R, 1, 5); }
      if (dist(x, R + 4.5, 799, 178) < calcularTam(799, 178)/2) { fill(Rojo); rect(x, R, 1, 5); }
      
      //  CIRCULOS VERDES 
      if (dist(x, V + 2.5, 464, 70)  < calcularTam(464, 70)/2)  { fill(Verde); rect(x, V, 1, 5); }
      if (dist(x, V + 2.5, 554, 204) < calcularTam(554, 204)/2) { fill(Verde); rect(x, V, 1, 5); }
      if (dist(x, V + 2.5, 522, 347) < calcularTam(522, 347)/2) { fill(Verde); rect(x, V, 1, 5); }
    }
  }
}

void dibujarCirculo(float x, float y) {

  float tam = calcularTam(x, y);

  fill(255, 220, 180);
  circle(x, y, tam);
}

float calcularTam(float x, float y) {

  float distancia = dist(mouseX, mouseY, x, y);

  return map(distancia, 0, 500, 120, 40);
}

void mousePressed() {

  Color++;

  if (Color > 3) {
    Color = 0;
  }
}
      
