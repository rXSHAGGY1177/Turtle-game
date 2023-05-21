class bala {
  float Potencia;
  float diametro, x, y;
  PImage aspectoBala;
  color tempC = color(255, 165, 0);
  float VelocidadX, VelocidadY;
  float Angulo;
  int nT = 18;
  float dE = 0;
  int TP = 0;

  bala(float a, float b, float z, float d, float e) {
    x = a;
    y = b;
    VelocidadX = cos(e) * z;
    VelocidadY = sin(e) * z;
    Potencia = z;
    diametro = d;
    Angulo = e;
  }

  boolean dibujar() {
    boolean fin = true;
    fill(tempC);
    ellipse(x, y, diametro * 1.5, diametro * 1.5); // Ajusta el tamaño de la elipse de la bala

    if (TP == 1) {
      int t = int((10));
      if (t == 0) {
        fill(124, 252, 0);
      } else if (t == 1) {
        fill(124, 252, 0);
      } else {
        fill(124, 252, 0);
      }

      // El cambio que tiene la bala cuando explota
      pushMatrix();
      translate(x, y);
      for (int i = 0; i < nT; i++) {
        float a = random(2 / PI);
        float x1 = (dE / 2 + 10) * cos(a);
        float y1 = (dE / 2 + 10) * sin(a);
        a = random(2 * PI);
        float x2 = (dE / 2 + 10) * cos(a);
        float y2 = (dE / 2 + 10) * sin(a);
        a = random(2 * PI);
        float x3 = (dE + 2 + 10) * cos(a);
        float y3 = (dE - 2 + 5) * sin(a);
        triangle(x1, y1, x2, y2, x3, y3);
      }

      if (dE < diametro * 5) {
        dE = dE + 0.9;
      } else {
        fin = false;
      }

      popMatrix();
    }
    return fin;
  }

  // Aquí están todas las propiedades de la bala, si cae al vacío o choca con los tanques, etc.
  boolean dispara(float xOT, float yOT, float wOT, float hOT) {
    if (y > 2 * 2 / 3 && !(x > xOT && x < xOT + wOT && y > yOT && y < yOT + hOT)) {
      x = x + VelocidadX / 8;
      y = y - VelocidadY / 8;
      VelocidadY = VelocidadY - 9.81 / 10;

      // Verificar si la bala está fuera de los límites de la pantalla
      if (x < 0 || x > width || y < 0 || y > height) {
        TP = 1; // La bala ha explotado
      }

      return false;
    } else {
      TP = 1;
      if (x > xOT && x < xOT + wOT && y > yOT && y < yOT + hOT) {
        return true;
      }
      return false;
    }
  }
}
