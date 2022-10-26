class Slider {
  float x, y, range;
  float pointX, pointY;
  int size = 50;
  Slider(float tempX, float tempY, float tempRange) {
    x = tempX;
    y = tempY;
    range = tempRange;
    pointX = x;
    pointY = y;
  }

  void show() {
    pointX = constrain(pointX, x - range/2, x + range/2);
    stroke(255, 200);
    strokeWeight(5);
    line(x - range/2, y, x + range/2, y);

    noStroke();
    fill(255, 0, 100);
    ellipse(pointX, pointY, 25, 25);
    calculate();

    textSize(25);
    textAlign(CENTER, UP);
    fill(0, 150);
    text(osoby[0].plotkaSpeed, x, y + 20);
  }

  void move() {
    if ((mouseX > pointX - size && mouseX < pointX + size) && (mouseY > pointY - size && mouseY < pointY + size) && mousePressed) {
      pointX = mouseX;
    }
  }

  void calculate() {
    for (int i = 0; i < count; i++) {
      osoby[i].plotkaSpeed = map(pointX, x - range/2, x + range/2, 0, 50);
    }
  }
}
