class Llantas{
  float diametro, x, y, vRotacion;
  float anchoCuerpo;
  PImage aspectoLlanta;
  float a;
  
  Llantas(float d, float a, float b, float v,float aC){
    diametro = d;
    x = a;
    y = b;
    vRotacion = v;
    anchoCuerpo=aC;
    a=0;
  }
  
  void Dibuja (){
   stroke(0);//Linea del centro
  }
  
  void rota(){
    //a+=0.02;
  }
  void mueveD(){
    x+=30;
  }
  void mueveI(){
    x-=30;
  }
}
