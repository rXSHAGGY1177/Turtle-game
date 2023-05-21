class Canion{
  float Potencia;
  float alto;
  float longitud;
  color c;
  float x;
  float y;
  float angulo;
  float velocidad;
  int tipocanion;
  
  Canion(float h,float w,float a,float b,color g, float A){
    alto=h;
    longitud=w;
    x=a;
    y=b;
    c=g;
    angulo=A;
    
    if (angulo==0){
      tipocanion=0;
    }
    else if(angulo==PI){
      tipocanion=1;
    }
  }
  
   void Dibuja(){
    pushMatrix();
    if (tipocanion==0){
      translate(x,y);
       rotate(angulo);
        fill(c);
          rect(0,-alto/2,longitud,alto);
    }
    else if(tipocanion==1){
      translate(x+longitud,y);
       rotate(angulo+PI);
        fill(c);
        rect(0-longitud,-alto/2,longitud,alto);
    }
   
    popMatrix();
  }
  
  void setAngulo(float a){
    angulo=a;
  }
  
  void mueveD(){
    x+=30;
  }
  
  void mueveI(){
    x-=30;
  }
}

  
