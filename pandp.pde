float boy = 0;
float girl = 0;

int padding = 200;

PImage boy_img = loadImage("http://app.inter-arteq.com/pocky_and_pletz_2014/data/boy.png");
PImage girl_img = loadImage("http://app.inter-arteq.com/pocky_and_pletz_2014/data/girl.png");
PImage title_img = loadImage("http://app.inter-arteq.com/pocky_and_pletz_2014/data/pockyandpletz.png");

float panning = 0;

boolean bEnd = false;

void setup(){
  size(638, 480);
}

void draw(){
  background(255);
  if(bEnd){
    if(panning<300+height/2-title_img.height/2){
      panning += 3;
    }
  }else{
    if(random(0,1) < 0.05)
    girl += random(0, 0.2);
  }
  float boy_lip = map(boy, 0, 13.5, padding, width-padding);
  float girl_lip = map(girl, 13.5, 0, padding, width-padding);
    
  noStroke();
  
  fill(0);
  rect(0,girl_img.height+134+panning, width, 2);
  rect(padding+50,girl_img.height+133+panning, width, 4);
  
  fill(255);
  rect(0,0,boy_lip,height);
  rect(girl_lip,0,width-girl_lip,height);
  
  fill(0);
  
  image(boy_img, boy_lip-boy_img.width+30,height-boy_img.height+panning);
  image(girl_img, girl_lip-15, height-girl_img.height+25+panning);
  
  if(girl+boy>13.5){
    bEnd = true; 
  }
  
  if(bEnd){
    image(title_img,(width-title_img.width)/2,panning-300);
  }
}

void keyReleased(){
  boy += 0.1;
}
