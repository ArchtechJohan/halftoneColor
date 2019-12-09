import processing.pdf.*;
import java.util.Calendar;

PImage img;


void setup() {
  size(1000, 1000);
  background(255);
  smooth();
  
  beginRecord(PDF, timestamp()+".pdf");
  
  img = loadImage("testpattern.png");
  
  img.loadPixels();

  processImage(img, width, height, 24);
  
  img.updatePixels();

  endRecord();

}


void draw() {

}

void processImage(PImage pic, int sizeX, int sizeY, int subsize) {
  for (int y = 0; y < sizeY; y += subsize) {
    for (int x = 0; x < sizeX; x += subsize) {
      processSubimage(pic, sizeX, sizeY, x, y, subsize);
    }
  }

}

void processSubimage(PImage pic, int sizeX, int sizeY, int x_start, int y_start, int subsize) {
    int totR = 0;
    int totG = 0;
    int totB = 0;
    int tot = 0;
    int numPixels = 1;
    pic.loadPixels();
               
    if ((x_start > (sizeX-subsize)) && (y_start <= (sizeY-subsize))) {
    
        for (int y = y_start; y < (y_start+subsize); y++) {
          for (int x = x_start; x < sizeX; x++) {
            tot += (red(pic.pixels[y*sizeX + x])+green(pic.pixels[y*sizeX + x])+blue(pic.pixels[y*sizeX + x]))/3;
            totR += red(pic.pixels[y*sizeX + x]);
            totG += green(pic.pixels[y*sizeX + x]);
            totB += blue(pic.pixels[y*sizeX + x]);
            numPixels++;
            
          }
        }
        
        totR = totR/numPixels;
        totG = totG/numPixels;
        totB = totB/numPixels;
        
    }
    
    
    
    if ((x_start <= (sizeX-subsize)) && (y_start > (sizeY-subsize))) {
    
        for (int y = y_start; y < sizeY; y++) {
          for (int x = x_start; x < (x_start+subsize); x++) {
            tot += (red(pic.pixels[y*sizeX + x])+green(pic.pixels[y*sizeX + x])+blue(pic.pixels[y*sizeX + x]))/3;
            totR += red(pic.pixels[y*sizeX + x]);
            totG += green(pic.pixels[y*sizeX + x]);
            totB += blue(pic.pixels[y*sizeX + x]);
            numPixels++;
          }
        }

        totR = totR/numPixels;
        totG = totG/numPixels;
        totB = totB/numPixels;
        
    }
    
    
    
    if ((x_start > (sizeX-subsize)) && (y_start > (sizeY-subsize))) {
    
        for (int y = y_start; y < sizeY; y++) {
          for (int x = x_start; x < sizeX; x++) {
            tot += (red(pic.pixels[y*sizeX + x])+green(pic.pixels[y*sizeX + x])+blue(pic.pixels[y*sizeX + x]))/3;
            totR += red(pic.pixels[y*sizeX + x]);
            totG += green(pic.pixels[y*sizeX + x]);
            totB += blue(pic.pixels[y*sizeX + x]);
            numPixels++;
          }
        }

        totR = totR/numPixels;
        totG = totG/numPixels;
        totB = totB/numPixels;    
        
    }
    
    
    //default
    if ((x_start <= (sizeX-subsize)) && (y_start <= (sizeY-subsize))) {
    
        for (int y = y_start; y < (y_start+subsize); y++) {
          for (int x = x_start; x < (x_start+subsize); x++) {
            tot += (red(pic.pixels[y*sizeX + x])+green(pic.pixels[y*sizeX + x])+blue(pic.pixels[y*sizeX + x]))/3;
            totR += red(pic.pixels[y*sizeX + x]);
            totG += green(pic.pixels[y*sizeX + x]);
            totB += blue(pic.pixels[y*sizeX + x]);
            numPixels++;
          }
        }

        totR = totR/numPixels;
        totG = totG/numPixels;
        totB = totB/numPixels;  
        
    }

    
    if ((tot/(subsize*subsize)) >= 0 && (tot/(subsize*subsize)) < 32) {
      noStroke();
      fill(totR, totG, totB);
      ellipse(x_start + subsize/2, y_start + subsize/2, subsize-3, subsize-3);
      
    }
    
    if ((tot/(subsize*subsize)) >= 32 && (tot/(subsize*subsize)) < 64) {
      noStroke();
      fill(totR, totG, totB);
      ellipse(x_start + subsize/2, y_start + subsize/2, 0.88*subsize, 0.88*subsize);
      
    }
    
    if ((tot/(subsize*subsize)) >= 64 && (tot/(subsize*subsize)) < 96) {
      noStroke();
      fill(totR, totG, totB);
      ellipse(x_start + subsize/2, y_start + subsize/2, 0.8*subsize, 0.8*subsize);
      
    }
    
    if ((tot/(subsize*subsize)) >= 96 && (tot/(subsize*subsize)) < 128) {
      noStroke();
      fill(totR, totG, totB);
      ellipse(x_start + subsize/2, y_start + subsize/2, 0.72*subsize, 0.72*subsize);
      
    }
    
    if ((tot/(subsize*subsize)) >= 128 && (tot/(subsize*subsize)) < 160) {
      noStroke();
      fill(totR, totG, totB);
      ellipse(x_start + subsize/2, y_start + subsize/2, 0.64*subsize, 0.64*subsize);
      
    }
    
    if ((tot/(subsize*subsize)) >= 160 && (tot/(subsize*subsize)) < 192) {
      noStroke();
      fill(totR, totG, totB);
      ellipse(x_start + subsize/2, y_start + subsize/2, 0.4*subsize, 0.4*subsize);
      
    }
    
    if ((tot/(subsize*subsize)) >= 192 && (tot/(subsize*subsize)) < 224) {
      noStroke();
      fill(totR, totG, totB);
      ellipse(x_start + subsize/2, y_start + subsize/2, 0.35*subsize, 0.35*subsize);
      
    }
    
    if ((tot/(subsize*subsize)) >= 224 && (tot/(subsize*subsize)) < 250) {
      noStroke();
      fill(totR, totG, totB);
      ellipse(x_start + subsize/2, y_start + subsize/2, 0.3*subsize, 0.3*subsize);
      
    }
    
    
    pic.updatePixels();
    
}

void keyReleased() {
  if (key == 's' || key == 'S') saveFrame(timestamp()+"_##.png");
}

// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}