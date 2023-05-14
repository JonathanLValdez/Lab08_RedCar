Add keyPressed() to change the effect and print the name of the kernel you are applying.

```
  currentKernel = 0;
  names = new String[]{
    "Identity", "Blur", "Sharpen",
    "Outline", "Left Sobel", "Right Sobel",
    "Top Sobel", "Emboss"
  };

  kernels = new Kernel[] {
    new Kernel( new float[][] {
      {0, 0, 0},
      {0, 1, 0},
      {0, 0, 0}
    }) ,
    new Kernel( new float[][] {
      {.111, .111, .111},
      {.111, .111, .111},
      {.111, .111, .111}
    }) ,
    new Kernel( new float[][] {
      {0, -1, 0},
      {-1, 5, -1},
      {0, -1, 0}
    }) ,
    new Kernel( new float[][] {
      {-1, -1, -1},
      {-1, 8, -1},
      {-1, -1, -1}
    }) ,
    new Kernel( new float[][] {
      {1, 0, -1},
      {2, 0, -2},
      {1, 0, -1}
    }) ,
    new Kernel( new float[][] {
      {-1, 0, 1},
      {-2, 0, 2},
      {-1, 0, 1}
    }) ,
    new Kernel( new float[][] {
      {1, 2,  1},
      {0, 0, 0},
      {-1, -2, -1}
    }),
    new Kernel( new float[][] {
      {-2, -1,  0},
      {-1, 1, 1},
      {0, 1, 2}
    })
  };
}

  // Set initial kernel
  Kernel k = kernels[currentKernel];
  k.apply(car, output);

  image(car, 0, 0);
  image(output, car.width, 0);
}

void draw() {
  // Add any animation or continuous updates here
}

void keyPressed() {
  // Change the effect and print the name of the kernel being applied
  if (key >= '1' && key <= '8') {
    currentKernel = key - '1';
    Kernel k = kernels[currentKernel];
    k.apply(car, output);
    println("Applying kernel: " + names[currentKernel]);
    image(output, car.width, 0);
  }
}
```
