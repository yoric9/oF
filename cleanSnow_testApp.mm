#include "testApp.h"

//--------------------------------------------------------------
void testApp::setup(){
    
    
    
    ofBackground(150);
     touched[0]= false;
     touched[1]= false;
     moved = false;
    
    
    

    mySnow.resize(500);
    for(int i=0;i<mySnow.size();i++){
        mySnow[i].setup();
    }
    
    //pX,pY is the initial position of snow
    for(int i=0;i<mySnow.size();i++){
        mySnow[i].pX= ofRandomWidth();
        mySnow[i].pY= ofRandomHeight();
        mySnow[i].under = false;
        mySnow[i].index = i;
    }
    
    
     //for the sweeping snow sound
     mySound.loadSound("sweep.wav");
    //mySound.setLoop(true);
    myVolume = 30;
    


}

//--------------------------------------------------------------
void testApp::update(){
    
    
    
    centerX = (posX[0]+posX[1])/2;
    centerY = (posY[0]+posY[1])/2;
    angle = atan2(posY[0] - posY[1], posX[0] - posX[1]);
    degree = angle * 180 / PI;
    brushWidth = ofDist(posX[0], posY[0],posX[1], posY[1]);
   /*
    printf("x1=%f, y1=%f \n",posX[0],posY[0]);
    printf("x2=%f, y2=%f \n",posX[1],posY[1]);
    printf("dist=%f \n",brushWidth);
    printf("centerX=%f, centerY=%f \n",centerX,centerY);
    printf("degree=%f \n",degree);
    */
    
    //decide if snow is under the brush and if so save them to the vector of underSnow
    if(moved){
    for(int i=0;i<mySnow.size();i++){
        
        
        if (((mySnow[i].pX>centerX-25 && mySnow[i].pX<centerX+25 && mySnow[i].pY>centerY-25 && mySnow[i].pY<centerY+25)||
            (mySnow[i].pX>posX[0]-25 && mySnow[i].pX<posX[0]+25 && mySnow[i].pY>posY[0]-25 && mySnow[i].pY<posY[0]+25)||
            (mySnow[i].pX>posX[1]-25 && mySnow[i].pX<posX[1]+25 && mySnow[i].pY>posY[1]-25 && mySnow[i].pY<posY[1]+25))
            && mySnow[i].under==false) {
            underSnow.push_back(mySnow[i].index);
            mySnow[i].under = true;
            }
      
        }
    }
    
    printf("numOfUnderSnow=%i \n",int(underSnow.size()));
    
    
    
    
}

//--------------------------------------------------------------
void testApp::draw(){
    
    //if the snow is under the brush draw it with the background color, otherwise keep drawing with white.
    //moving the brushed snow is not yet implemented!
    
    for(int i=0;i<mySnow.size();i++){
        
        if(mySnow[i].under){
            
            mySnow[i].draw(mySnow[i].pX,mySnow[i].pY,150);
            
            
        }else{
            
            mySnow[i].draw(mySnow[i].pX,mySnow[i].pY,255);
            
        }
        
    }
  
 
    //if touched at both points, draw a line between them and circle in the center
    
    if(touched[0]&&touched[1]){
        ofSetColor(252, 129, 5,220);
        ofPushMatrix();
        ofSetRectMode(OF_RECTMODE_CENTER);
        ofTranslate(centerX, centerY);
        ofRotate(degree+90);
        ofRectRounded(0,0, 50, brushWidth+30,10);
        ofPopMatrix();
        
        ofSetColor(255, 0, 0,200);
        ofCircle(centerX, centerY, 3);
  
           }

}

//--------------------------------------------------------------
void testApp::exit(){

}

//--------------------------------------------------------------
void testApp::touchDown(ofTouchEventArgs & touch){
    
  
    
    //set the position of two points
    touched[touch.id] =true;
    posX[touch.id] = touch.x;
    posY[touch.id] = touch.y;
    
    mySound.setVolume(myVolume);
    mySound.play();

}

//--------------------------------------------------------------
void testApp::touchMoved(ofTouchEventArgs & touch){
    
    moved = true;
    
    //move the position of the points
   
    posX[touch.id] = touch.x;
    posY[touch.id] = touch.y;
    
    //calculate the swipe of X and Y
        swipeX=centerX-oldCenterX;
        swipeY=centerY-oldCenterY;
        oldCenterX=centerX;
        oldCenterY=centerY;
    
    //printf("swipe X: %f, swipe Y: %f \n", swipeX, swipeY);
    
    
    
    

    


}

//--------------------------------------------------------------
void testApp::touchUp(ofTouchEventArgs & touch){
    
    touched[touch.id] =false;
    moved = false;
    
    //mySound.stop();


}

//--------------------------------------------------------------
void testApp::touchDoubleTap(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void testApp::touchCancelled(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void testApp::lostFocus(){

}

//--------------------------------------------------------------
void testApp::gotFocus(){

}

//--------------------------------------------------------------
void testApp::gotMemoryWarning(){

}

//--------------------------------------------------------------
void testApp::deviceOrientationChanged(int newOrientation){

}

