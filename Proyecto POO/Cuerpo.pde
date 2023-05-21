class Cuerpo{
  float altura;
  float ancho;
  PImage blindaje;
  float x;
  float y;
  color c;
  int xPos = 50;
  PImage tortuga;
  PImage tortuga2;
  
  Cuerpo(float h,float w,float a,float b,color g){
    altura=h;
    ancho=w;
    x=a;
    y=b;
    c=g;
    tortuga = loadImage("tortuga.png");
    tortuga2 = loadImage("tortuga2.png");
  }
  
  float getAncho(){
    return ancho;
  }
  
  
void Dibuja(){
    if (x < width/2 - ancho/2) {
      image(tortuga, x, 260, 350, 320);
    }
    if (x > width/2 + ancho/5) {
      image(tortuga2, x + 350, 260, -500, 300);
    }
}
  
  void mueveD(){
    x+=30;
  }
  
  void mueveI(){
    x-=30;
  }
}
