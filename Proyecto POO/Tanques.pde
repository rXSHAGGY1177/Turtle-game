Tanque test1,test2; //Se crean dos objetos de la clase Tanque llamados test1 y test2
boolean TT1,TT2,PaIni; //Variables booleanas que indican si se ha detectado colisión de la bala con cada tanque
 //Variable que guarda el número del jugador ganador
int menuWidth = 300;
int menuHeight = 600;
int buttonWidth;
int buttonHeight = 50;
int buttonSpacing = 20;
int barWidth = 40;//Los valores de la pantalla de inicio de colores
int lastBar = -1;
bala b; //Se crea un objeto de la clase bala llamado b
int turno; //Variable que indica el turno del jugador actual
PImage space; //Se crea un objeto de la clase PImage llamado space, que representa la imagen del fondo
PImage tortuga;
PImage tortuga2;//Se crea un objeto de la clase PImage llamado tortuga, que representa la imagen del tanque
int g = 0;
boolean gana = false;

void setup(){ //Método que se ejecuta una sola vez al principio del programa
  size(1200,600);//Tamaño de la ventana
  colorMode(HSB, height, height, height);  
  noStroke();
  menuWidth = 300;
  menuHeight = 600;
  buttonWidth = width;
  buttonHeight = 50;
  buttonSpacing = 20;
  PaIni=true;
  tortuga = loadImage("tortuga.png");
  tortuga2 = loadImage("tortuga2.png");//Se carga la imagen del tanque
  background(0); //Color de fondo de la ventana
  surface.setTitle("El Juego mas cool de las tortugas!"); //Título de la ventana
  surface.setLocation(120, 40); //Ubicación de la ventana en la pantalla
  space=loadImage("fondo espacio.jpg"); //Se carga la imagen del fondo
  test1= new Tanque(width/7-90,2*height/3-40,100,200,color(255,225,225),40,150,color(225,225,225),60,80,1); //Se crea el primer tanque y se le dan sus atributos
  test2= new Tanque(width/2+width/4,2*height/3-50,100,200,color(0,0,0),40,150,color(0,0,0),60,80,2); //Se crea el segundo tanque y se le dan sus atributos
  b=new bala(50,400,10,100,50); //Se crea la bala y se le dan sus atributos
  turno=1; //Se inicializa la variable turno en 1
  TT1=false; //Se inicializan las variables booleanas en falso
  TT2=false;
  gana = false;
}

void dibujaJuego(){
        PaIni=false;
        image(space,0,0); //Se dibuja la imagen del fondo
        fondo(test1.vida,test2.vida); //Se llama a la función "fondo" para dibujar los indicadores de vida de los tanques
        TT1=test1.Dibuja(test2.x,test2.y,test2.C.ancho,test2.C.altura); //Se comprueba si la bala ha colisionado con el primer tanque
        TT2=test2.Dibuja(test1.x,test1.y,test1.C.ancho,test1.C.altura); //Se comprueba si la bala ha colisionado con el segundo tanque
        if(TT1){ //Si la bala ha colisionado con el primer tanque
          if(!test2.restaVida()){ //Si la vida del segundo tanque llega a cero
           dibujaGanador(1); //Se llama a la función "dibujaGanador" para indicar que el primer jugador ha ganado
          }
        }
        if(TT2){
          if(!test1.restaVida()){
           dibujaGanador(2);
          }
        }
        
        if (TT1) {
    if (!test2.restaVida()) {
      dibujaGanador(1);
    }
  }
  if (TT2) {
    if (!test1.restaVida()) {
      dibujaGanador(2);
    }
  }
  fill(0);
  rect(10, height - 60, 240, 40);
  fill(255);
  textSize(20);
  textAlign(LEFT, CENTER);
  text("Presiona (A) para disparar", 25, height - 45);
}

void dibujaMenu() {
  textSize(50);
  textAlign(CENTER, CENTER);
  rect(0, height / 2 - 50, buttonWidth, buttonHeight);
  fill(0);
  text("El MEJOR JUEGO DE LAS TORTUGAS", width / 2, 450 / 2 - 100);
  fill(0);
  rect(0, height / 2 - 50, buttonWidth, buttonHeight);
  fill(225);
  text("Iniciar el juego más cool de las tortugas", width / 2, height / 2 - 35);
  fill(200, 0, 0);
  fill(255);
  rect(0, height - 1, width, 100);
  fill(0);
  textSize(25);
  textAlign(CENTER, CENTER);
  text("By: Rodriguez Hernandez Jayr Adrian", width / 2, height - 30);
}

void mousePressed() {
  if (mouseX > width / 2 - buttonWidth / 2 && mouseX < width / 2 + buttonWidth / 2 && mouseY > height / 2 - 30 - buttonHeight / 2 && mouseY < height / 2 - 30 + buttonHeight / 2) {
    println("INICIA EL JUEGO MAS PERRON");
    PaIni = false;
  } else if (mouseX > width / 2 - buttonWidth / 2 && mouseX < width / 2 + buttonWidth / 2 && mouseY > height / 2 + buttonSpacing + buttonHeight / 2 && mouseY < height / 2 + buttonSpacing + buttonHeight * 1.5) {
    println("Ir a ver videos");
  }
}

void draw(){  //Método que se ejecuta continuamente en un ciclo
    int whichBar = mouseX / barWidth;
    if (whichBar != lastBar) {
    int barX = whichBar * barWidth;
    fill(mouseY, height, height);
    rect(barX, 0, barWidth, height);
    lastBar = whichBar;
  }

    if(PaIni){
      dibujaMenu();
    }
    else{
      dibujaJuego();
    }
}

void dibujaGanador(int gan){
  g = gan;
  gana = true;
  g=gan;
}

void fondo(float v1, float v2) {
  if (!(g == 0)) {
    textSize(100);
    textAlign(CENTER, TOP);
    if (gana) {
      fill(200, 0, 0); // Cambia el color a rojo si hay un ganador
    } else {
      fill(255, 160, 122); // Mantén el color original si no hay ganador
    }
    
    text("El Jugador mas perron " + str(g), width / 2, 20);
  }

  colorMode(RGB); // Cambia al modo de color RGB
  line(width / 2, 0, width / 2, height); // La línea del medio
  fill(0, 200, 0);
  rect(10, 10, (width / 2 - 20) * (v1 / 200), 30);
  rect(width - 10, 10, -(width / 2 - 20) * (v2 / 200), 30);
  fill(225, 225, 225);
  rect((width / 2 - 20) * (v1 / 200) + 10, 10, (width / 2 - 20) * ((200 - v1) / 200), 30);
  rect(width - 10 - (width / 2 - 20) * (v2 / 200), 10, -(width / 2 - 20) * ((200 - v2) / 200), 30);
  colorMode(HSB, height, height, height); // Restaura el modo de color HSB
}

//Teclas de los tanques
void keyPressed() {
  if (turno == 1 && !gana) { // Se verifica el turno y que no haya un ganador
    if (key == CODED) {
      if (keyCode == LEFT) {
        test1.mueveI();
      }
      if (keyCode == RIGHT) {
        test1.mueveD();
      }
      if (keyCode == UP) {
        test1.menosAngulo();
      }
      if (keyCode == DOWN) {
        test1.masAngulo();
      }
    }
    if (key == 'a') {
      test1.disparo();
      turno = turno * (-1);
    }
  } else if (turno == -1 && !gana) { // Se verifica el turno y que no haya un ganador
    if (key == CODED) {
      if (keyCode == LEFT) {
        test2.mueveI();
      }
      if (keyCode == RIGHT) {
        test2.mueveD();
      }
      if (keyCode == UP) {
        test2.menosAngulo();
      }
      if (keyCode == DOWN) {
        test2.masAngulo();
      }
    }
    if (key == 'a') {
      test2.disparo();
      turno = turno * (-1);
    }
  }
}
