class Tanque{
  
  Cuerpo C;
  Canion CN;
  int Tcanion;
  Llantas Ll;
  bala B;
  float angulo;
  boolean balaViva;
  float x,y;
  boolean tocoTanque;
  float vida;
  
  Tanque(float a,float b,float hC,float wC,color cC,float hCN,float wCN,color cCN,float d,float vR,int T){
    x=a;
    y=b;
    Tcanion=T;
    tocoTanque=false;
    C=new Cuerpo(hC,wC,x,y,cC);
    if(Tcanion==1){
    CN=new Canion(hCN,wCN,x+3*wC/4,y,cCN,0);
    angulo=0;
    }  
    else if (Tcanion==2){
      CN=new Canion(hCN,wCN,x-wC/4*2,y,cCN,PI);
      angulo=PI;
    }
    
    Ll=new Llantas(d,x,y+hC,vR,wC);
    vida=200;
  }
  
  boolean Dibuja(float xOT,float yOT,float wOT,float hOT){
    C.Dibuja();
    CN.Dibuja();
    Ll.Dibuja();
    if(balaViva){
    balaViva = b.dibujar();
    tocoTanque = b.dispara(xOT,yOT,wOT,hOT);
    }
    else{
      if(tocoTanque){
        tocoTanque=false;
        return true;
      }
    }
    return false;
  }
  
  void masAngulo(){
    angulo = angulo+0.02; 
    CN.setAngulo(angulo);
  }
  
  void menosAngulo(){
    angulo = angulo-0.02; 
    CN.setAngulo(angulo);
  }
  
  void mueveI(){
    x-=50;
    C.mueveI();
    CN.mueveI();
    Ll.mueveI();
  }
  void mueveD(){
    x+=50;
    C.mueveD();
    CN.mueveD();
    Ll.mueveD();
  }
  
  boolean restaVida(){
    vida=vida-(60);
    if(vida>0){
      return true;
    }
    else{
      vida=0;
      return false;
    }
  }

  void disparo(){
    b=new bala (x+3*C.getAncho()/4+CN.longitud*cos(angulo), y+CN.alto/2+CN.longitud*sin(angulo),70,20,-angulo);
    balaViva = true;
  }
}
