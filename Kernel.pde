public class Kernel {
  float[][] kernel;

  /** Constructor takes the kernel that will be applied to the image
   * This implementation only allows 3x3 kernels
   */
  public Kernel(float[][] init) {
    kernel = init;
  }

  /**
   * If part of the kernel is off of the image, return black. Otherwise,
   * calculate the convolution of r/g/b separately, and return that color.
   * If the calculation for any of the r, g, b values is outside the range
   * 0-255, then clamp it to that range (< 0 becomes 0, >255 becomes 255).
   */
  public color calcNewColor(PImage img, int x, int y) {
    float rsum = 0;
    float gsum = 0;
    float bsum = 0;

    for (int i = -1; i <= 1; i++) {
      for (int j = -1; j <= 1; j++) {
        int px = x + i;
        int py = y + j;

        // Check if the pixel is within the image boundaries
        if (px >= 0 && px < img.width && py >= 0 && py < img.height) {
          float weight = kernel[i + 1][j + 1];
          color c = img.get(px, py);

          rsum += weight * red(c);
          gsum += weight * green(c);
          bsum += weight * blue(c);
        }
      }
    }

    // Clamp the color values to the range 0-255
    int r = (int) constrain(rsum, 0, 255);
    int g = (int) constrain(gsum, 0, 255);
    int b = (int) constrain(bsum, 0, 255);

    return color(r, g, b);
  }

  /** Apply the kernel to the source and save the data to the destination. */
  public void apply(PImage source, PImage destination) {
    for (int x = 0; x < source.width; x++) {
      for (int y = 0; y < source.height; y++) {
        color newColor = calcNewColor(source, x, y);
        destination.set(x, y, newColor);
      }
    }
  }
}
