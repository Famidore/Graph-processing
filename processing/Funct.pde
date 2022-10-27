boolean layouted = false;
int iters = 0;
int best = 0;
float contsPi = 3.14;
float rDiff = 3.14;// change for ellipse radius in "connected" mode

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
    } else if (type == "cliques") {
      cliquesGraph();
    } else {
      noLoop();
      background(51);
      textSize(64);
      fill(0, 255, 150, 150);
      textAlign(CENTER, DOWN);
      text("Please define a layout!", width/2, height/2);
    }
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
