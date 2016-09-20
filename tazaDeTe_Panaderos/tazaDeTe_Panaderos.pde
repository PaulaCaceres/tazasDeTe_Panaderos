PImage fondo;
ArrayList<panadero> flores;
int cuantas = 20;
int rotacion = 0;

void setup() {
  size(1920, 1080, P3D);
  hint(ENABLE_DEPTH_SORT);
  fondo = loadImage("fondo.png");
  
  
  //luci = new luciernaga();
  flores = new ArrayList<panadero>();
  for (int i=0; i<cuantas; i++) {
    flores.add(new panadero());
  }
}

void draw() {
  background(0);
  image(fondo, 0, 0);
  
  

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