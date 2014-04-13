/*testApp.h*/ 

#pragma once

#include "ofMain.h"
#include "ofxiOS.h"
#include "ofxiOSExtras.h"

#include "Snow.h"

#define touchPoint 2

class testApp : public ofxiOSApp{
	
    public:
        void setup();
        void update();
        void draw();
        void exit();
	
        void touchDown(ofTouchEventArgs & touch);
        void touchMoved(ofTouchEventArgs & touch);
        void touchUp(ofTouchEventArgs & touch);
        void touchDoubleTap(ofTouchEventArgs & touch);
        void touchCancelled(ofTouchEventArgs & touch);

        void lostFocus();
        void gotFocus();
        void gotMemoryWarning();
        void deviceOrientationChanged(int newOrientation);
    
    //define variables of brush
    float posX[touchPoint];
    float posY[touchPoint];
    float centerX ,centerY;
    float oldCenterX, oldCenterY;
    float swipeX, swipeY;
    float  brushWidth;
    //ofRectangle brushShade;
    bool touched[touchPoint];
    bool  moved;
    
    //define variables of snow
    vector <Snow> mySnow;
    vector <float> underSnow;
   
    float angle;
    float degree;
    
    ofSoundPlayer mySound;
    float myVolume;
    
    
  
    
    };




