//variable para guardar tiempo transcurrido
int tiempo;
//variable para guardar el tiempo de delay necesario
int delay = 500;

PImage fondo;
PImage [] animacion1 = new PImage [3];
PImage [] animacion2 = new PImage [3];
PImage [] animacion3 = new PImage [3];

ArrayList<panadero> flores;
int cuantas = 100;
int rotacion = 0;

void setup() {
  size(1920, 1080, P3D);
  hint(ENABLE_DEPTH_SORT);
  
  //guardar tiempo actual
  tiempo = millis();
  
  fondo = loadImage("fondo.png");
  
  // dibujar particulas individuales para el fondo y animarlas
  
   for ( int i = 0; i<animacion1.length; i++ ) {
      animacion1[i] = loadImage( "adelante" + (i+1) + ".png" );
      }
      
  for ( int i = 0; i<animacion2.length; i++ ) {
      animacion2[i] = loadImage( "medio" + (i+1) + ".png" );
      }
      
  for ( int i = 0; i<animacion3.length; i++ ) {
      animacion3[i] = loadImage( "atras" + (i+1) + ".png" );
      }
      
  
  //flores = new panadero();
  flores = new ArrayList<panadero>();
  for (int i=0; i<cuantas; i++) {
    flores.add(new panadero());
  }
}

void draw() {
  background(0);
  image(fondo, 0, 0);
  int quePan = int(random(0, 3));

  //chequear si el tiempo transcurrido - el tiempo guardado al principio es mayor al delay
  if(millis() - tiempo >= delay) {
    //dibujar imágenes
    image(animacion1[quePan], 90, 700);
    image(animacion2[quePan], 900, 850);
    image(animacion3[quePan], 1400, 830);
    //actualizar tiempo guardado
    tiempo = millis();
   
  }


  stroke(255, 0, 0);

  pushMatrix();
  translate(width/2, height/2, width/-2);
  //rotateY(-radians(rotacion));
  /*
  noFill();
  sphereDetail(10);
  sphere(width);
  */


  for (int n=0; n<5; n++) {
    pushMatrix();
    rotateY(radians(n*(360/5)));
    pushMatrix();
    translate(width/2, 0, 0);
    rotateY(-radians(rotacion));
    //stroke(0,255,0);
    //sphere(width/5);
    for (int i = 0*n; i < flores.size()/5; i++) {  
      panadero l = flores.get(i + (flores.size()/5)*n);
      pushMatrix();
      rotateY(-radians(n*(360/5)));
      l.draw();
      popMatrix();
    }
    popMatrix();
    popMatrix();
  }
  popMatrix();
  rotacion++;
}