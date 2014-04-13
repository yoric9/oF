#pragma once

class Snow{
    
public:
    
    
    void setup(){
        
        radius= 3;
    }
    
    void update(){
        
    }
    
    void draw(float sX,float sY,float color){
      
        
            ofSetColor(color);
            ofCircle(sX,sY,radius);
        
        
    }
    
   
    float radius,pX,pY,snowCol;
    int index;
    bool under;
    
};
