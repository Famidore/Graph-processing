boolean layouted = false;
int iters = 0;
int best = 0;
float contsPi = 3.14;

void restart() {
  for (int i = 0; i < count; i++) {
    osoby[i].b = 0;
    osoby[i].plotka = false;
  }
  iters = 0;
}

void layouts(String type, int index) {
  if (layouted != true) {
    layouted = true;
    if (type == "connected") {
      connectedGraph();
    } else if (type == "random") {
      layouted = false;
      osoby[index].connect();
    } else if (type == "group") {
      groupGraph(index);
      layouted = false;
    } else {
      noLoop();
      noLoop();
      background(51);
      textSize(64);
      fill(0, 255, 150, 150);
      textAlign(CENTER, DOWN);
      text("Please define a layout!", width/2, height/2);
    }
  }
}

void connectedGraph() {
  for (int i = 1; i < count; i++) {
    osoby[i].connections[i-1] = i;
  }
  osoby[count - 1].connections[0] = 1;
  for (int i = 0; i < count; i++) {
    float j = sin(map(i, 0, count, 0, 2 * contsPi));
    float k = cos(map(i, 0, count, 0, 2 * contsPi));
    osoby[i].x = map(j * contsPi, 0, 2 * contsPi, 100, (width-100)) + width/2 - 100;
    osoby[i].y = map(k * contsPi, 0, 2 * contsPi, 100, (height-100)) + height/2 - 100;
    //println(osoby[i].x);
  }
}

void iterCount() {
  int newBest = 0;
  for (int i = 0; i < count; i++) {
    if (osoby[i].b >= 205) {
      newBest++;
    }
  }
  if (newBest != best) {
    iters++;
    best = newBest;
  }
  textSize(32);
  textAlign(CENTER, DOWN);
  fill(255, 0, 50, 200);
  text("Iterations: " + iters, 100, 50);
}

void groupGraph(int index) {
  for (int i = 0; i < count; i++) {
    osoby[i].allowedDistance = 100;
    osoby[i].maxConns = 10;
    osoby[i].size = (osoby[i].nOfConns + 1) * 5;
  }
  osoby[index].connect();
}
