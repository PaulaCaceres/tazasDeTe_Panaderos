class panadero {
  PVector posicion ;
  PImage [] flor = new PImage [5];
  float contador = random(360);
  float velocidad = random(2)+ 0.1;

  // Es como el setup() del codigo principal
  panadero() { 
    for ( int i = 0; i<flor.length; i++ ) {
      flor[i] = loadImage( "pana" + (i+1) + ".png" );
    } 
    posicion = new PVector(random(-width/4, width/4), 0, random(-width/4, width/4));
  }

  void draw() {
    posicion.y = sin(radians(contador)) * 200;
    int cualLuci = int(random(0, 5));
    pushMatrix();
    translate(posicion.x, posicion.y, posicion.z);
    //rotateY(-radians(rotacion));
    rotateY(radians(rotacion));
    image(flor[cualLuci], 0, 0);
    popMatrix();
    contador += velocidad;
  }
} 