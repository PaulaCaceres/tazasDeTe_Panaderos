PImage fondo;
PImage [] pan = new PImage [3];
PImage [] pan2 = new PImage [3];
PImage [] pan3 = new PImage [3];

ArrayList<panadero> flores;
int cuantas = 100;
int rotacion = 0;

void setup() {
  size(1920, 1080, P3D);
  hint(ENABLE_DEPTH_SORT);
  fondo = loadImage("fondo.png");
  
  // dibujar particulas individuales para el fondo y animarlas
  
   for ( int i = 0; i<pan.length; i++ ) {
      pan[i] = loadImage( "adelante" + (i+1) + ".png" );
      }
      
  for ( int i = 0; i<pan2.length; i++ ) {
      pan2[i] = loadImage( "medio" + (i+1) + ".png" );
      }
      
  for ( int i = 0; i<pan3.length; i++ ) {
      pan3[i] = loadImage( "atras" + (i+1) + ".png" );
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
  image(pan[quePan], 90, 700);
  image(pan2[quePan], 900, 850);
  image(pan3[quePan], 1400, 830);
  

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