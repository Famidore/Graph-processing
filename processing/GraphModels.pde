void connectedGraph() {
  for (int i = 1; i < count; i++) {
    osoby[i].connections[i-1] = i;
  }
  osoby[count - 1].connections[0] = 1;
  for (int i = 0; i < count; i++) {
    float j = sin(map(i, 0, count, 0, 2 * contsPi));
    float k = cos(map(i, 0, count, 0, 2 * contsPi));
    osoby[i].x = map(j * rDiff, 0, 2 * contsPi, 100, (width-100)) + width/2 - 100;
    osoby[i].y = map(k * rDiff, 0, 2 * contsPi, 100, (height-100)) + height/2 - 100;
    //println(osoby[i].x);
  }
}


void groupGraph(int index) {
  for (int i = 0; i < count; i++) {
    osoby[i].allowedDistance = 100;
    osoby[i].maxConns = 10;
    osoby[i].size = (osoby[i].nOfConns + 5) * 3;
  }
  osoby[index].connect();
}


void cliquesGraph() {
  
  
}
