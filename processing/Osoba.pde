class Osoba {
  boolean plotka = false;
  float allowedDistance = 300;
  float x, y, b;
  int size = 25;
  int ID, nOfConns, maxConns;
  int[] connections = new int [count];
  boolean connSwitch = false;
  float plotkaSpeed = 10;

  Osoba(int tempID, float tempX, float tempY) {
    x = tempX;
    y = tempY;
    ID = tempID;
    b = 0;
    maxConns = 2;
  }


  void show() {
    fill(255, b, 100, 150);
    noStroke();
    ellipse(x, y, size, size);
    enumerate();
  }

  void connect() {
    if (connSwitch != true) {
      for (int i = 0; i < count; i++) {
        if (i != ID && nOfConns < maxConns) {
          if (abs(osoby[i].x - x) < allowedDistance && abs(osoby[i].y - y) < allowedDistance) {
            connections[i] = osoby[i].ID;
            osoby[i].connections[ID] = ID;
            nOfConns += 1;
          }
        }
      }
      connSwitch = true;
    }
  }

  void makeLines() {
    for (int i = 0; i < count; i++) {
      if (connections[i] != 0) {
        stroke(255, 25);
        line(x, y, osoby[i].x, osoby[i].y);
      }
    }
  }

  void plotkaTime() {
    if (plotka) {
      b += plotkaSpeed;
      if (plotka && b > 255) {
        for (int i = 0; i < count; i++) {
          if (connections[i] != 0) {
            if (osoby[i].plotka == false) {
              osoby[i].plotka = true;
            };
          }
        }
      }
    }
    for (int i = 0; i < count; i++) {
      if (connections[i] != 0) {
        if (osoby[i].plotka && osoby[i].b > 255) {
          plotka = true;
        }
      }
    }
  }

  void enumerate() {
    textSize(size);
    textAlign(CENTER, UP);
    fill(0, 150);
    text(ID, x, y);
  }
}
