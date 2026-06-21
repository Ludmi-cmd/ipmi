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
      
