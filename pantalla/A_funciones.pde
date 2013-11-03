public void keyReleased() {        //Detectar Tecla Levantada
  if(keyCode == UP){
    indexpaises--;
  }  
  
  if(keyCode == DOWN){
    indexpaises++;
  } 
  
  if(keyCode == RIGHT){
    indexanos++;
  } 
  
  if(keyCode == LEFT){
    indexanos--;
  } 
  
  indexanos = constrain(indexanos, 0, 51);
  indexpaises = constrain(indexpaises, 0, 213);
}

