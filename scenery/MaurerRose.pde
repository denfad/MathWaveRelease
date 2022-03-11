class MaurerRose implements GrafOBJ{
  float xShape;
  float yShape;
  float zShape;
  //variables for movement
  boolean shapeMovementDirection =true;
  int shapeMovementCount;
  int shapeMovementAmplitude = 60;
  float shapeMovementVelocity; //add this to all x or y or z vertex coordinates, to get a movement effect
  float shapeMovementAcceleration = 0.1;
  //variables for shrinking
  boolean shapeShrinkingDirection =true;
  int shapeShrinkingCount;
  int shapeShrinkingAmplitude = 200;
  float shapeShrinkingVelocity; //add this to all x or y or z vertex coordinates, to get a shrinking(scaling) effect
  float shapeShrinkingAcceleration = 0.1;

  float shapeSize =100;
  color shapeColor = color(200, 100,58);
  float xRotation;
  float yRotation;
  float zRotation;
  float xRotationSpeed = 0;
  float yRotationSpeed = 0.0008; 
  float zRotationSpeed = 0.0002;
  float n = random(1,10);
  float d = random(10,100);


  MaurerRose(){
   
   
  }
  
  void setuping(float xShape, float yShape, float zShape, int shapeMovementAmplitude, float shapeMovementAcceleration, int shapeShrinkingAmplitude, float shapeShrinkingAcceleration, float shapeSize, color shapeColor, float xRotation, float yRotation, float zRotation, float xRotationSpeed, float yRotationSpeed, float zRotationSpeed) {
    this.xShape = xShape;
    this.yShape = yShape;
    this.zShape = zShape;
    this.shapeMovementAmplitude = shapeMovementAmplitude;
    this.shapeMovementAcceleration = shapeMovementAcceleration;
    this.shapeShrinkingAmplitude = shapeShrinkingAmplitude;
    this.shapeShrinkingAcceleration = shapeShrinkingAcceleration;
    this.shapeSize = shapeSize;
    this.shapeColor = shapeColor;
    this.xRotation = xRotation;
    this.yRotation = yRotation;
    this.zRotation = zRotation;
    this.xRotationSpeed =  xRotationSpeed;
    this.yRotationSpeed =  yRotationSpeed;
    this.zRotationSpeed =  zRotationSpeed;

}
  
  void calculating() {
    //calculating movement behaviour
    if (shapeMovementDirection==true){
      shapeMovementVelocity+=shapeMovementAcceleration;
      shapeMovementCount++;
    }
    else{
      shapeMovementVelocity-=shapeMovementAcceleration;
      shapeMovementCount--;
    }
    if (shapeMovementCount==shapeMovementAmplitude){
    
      shapeMovementDirection =false;
    }
    if (shapeMovementCount==-shapeMovementAmplitude){
    
      shapeMovementDirection =true;
    }


    //calculating shrinking behaviour
    if (shapeShrinkingDirection==true){
      shapeShrinkingVelocity+=shapeShrinkingAcceleration;
      shapeShrinkingCount++;
    }
    else{
      shapeShrinkingVelocity-=shapeShrinkingAcceleration;
      shapeShrinkingCount--;
    }
    if (shapeShrinkingCount==shapeShrinkingAmplitude){
    
      shapeShrinkingDirection =false;
    }
    if (shapeShrinkingCount==-shapeShrinkingAmplitude){
    
      shapeShrinkingDirection =true;
    }

    //changing angle of a shape
    xRotation+=xRotationSpeed;
    yRotation+=yRotationSpeed;
    zRotation+=zRotationSpeed;
  }
  void display(){
  strokeWeight(1);
  stroke(shapeColor);
   pushMatrix();
    translate(xShape,yShape, zShape);
    rotateX(xRotation);
    rotateY(yRotation);
    rotateZ(zRotation);
    beginShape();
    for (int angle = 0; angle<360; angle++){
      float k = angle*d*PI/180;
      float r = shapeSize*sin(n*k);
      float x  = r * cos(k);
      float y  = r * sin(k);
      
      curveVertex(x,y);
  
    }
    endShape();
   popMatrix();
  }
}