Osoba[] osoby;
Slider slider;
int count = 100;


void setup() {
  frameRate(120);
  size(1200, 800);
  osoby = new Osoba[count];
  slider = new Slider(width - 300, height - 50, 300);
  for (int i = 0; i < count; i++) {
    osoby[i] = new Osoba(i, random(100, width-100), random(100, height-100));
  }
}

void draw() {
  background(51);
  slider.show();
  for (int i = 0; i < count; i++) {
    osoby[i].show();
    layouts("group", i); // "connected"/"random"
    osoby[i].makeLines();
    osoby[i].plotkaTime();
  }
  iterCount();
  if (keyPressed) {
    restart();
  }
}

void mouseDragged() {
  slider.move();
  for (int i = 0; i < count; i++) {
    if ((mouseX > osoby[i].x - 25 && mouseX < osoby[i].x + 25) && (mouseY > osoby[i].y - 25 && mouseY < osoby[i].y + 25) && mousePressed) {
      osoby[i].b = 0;
      osoby[i].x = mouseX;
      osoby[i].y = mouseY;
      osoby[i].plotka = true;
    }
  }
}
