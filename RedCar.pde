
int currentKernel = 0;
String[] names;
Kernel[] kernels;
PImage car, output;

void setup() {
  size(1450, 500);
  car = loadImage("redcar.png");
  output = car.copy();

  names = new String[]{
    "Identity", "Blur", "Sharpen",
    "Outline", "Left Sobel", "Right Sobel",
    "Top Sobel", "Emboss"
  };

  kernels = new Kernel[] {
    new Kernel(new float[][] {
      {0, 0, 0},
      {0, 1, 0},
      {0, 0, 0}
    }),
    new Kernel(new float[][] {
      {.111, .111, .111},
      {.111, .111, .111},
      {.111, .111, .111}
    }),
    new Kernel(new float[][] {
      {0, -1, 0},
      {-1, 5, -1},
      {0, -1, 0}
    }),
    new Kernel(new float[][] {
      {-1, -1, -1},
      {-1, 8, -1},
      {-1, -1, -1}
    }),
    new Kernel(new float[][] {
      {1, 0, -1},
      {2, 0, -2},
      {1, 0, -1}
    }),
    new Kernel(new float[][] {
      {-1, 0, 1},
      {-2, 0, 2},
      {-1, 0, 1}
    }),
    new Kernel(new float[][] {
      {1, 2,  1},
      {0, 0, 0},
      {-1, -2, -1}
    }),
    new Kernel(new float[][] {
      {-2, -1,  0},
      {-1, 1, 1},
      {0, 1, 2}
    })
  };

  // Set initial kernel
  Kernel k = kernels[currentKernel];
  k.apply(car, output);

  image(car, 0, 0);
  image(output, car.width, 0);
}
public void draw() {
  // Add a filter when image is clicked upon
  if (mousePressed && mouseButton == LEFT) {
    Kernel blurKernel = new Kernel(new float[][] {
      {0.0625f, 0.125f, 0.0625f},
      {0.125f, 0.25f, 0.125f},
      {0.0625f, 0.125f, 0.0525f}
    });
    blurKernel.apply(car, output);
    image(output, car.width, 0);
  }
}

public void keyPressed() {
  // Change the effect and print the name of the kernel
  if (key >= '1' && key <= '8') {
    currentKernel = key - '1';
    Kernel k = kernels[currentKernel];
    k.apply(car, output);
    println(names[currentKernel]);
    image(output, car.width, 0);
  }
}
