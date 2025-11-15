package workshops.Workshop_2.exo3;

public class Main {
    public static void main(String[] args) {
        Image myImage = new BaseImage("photo.jpg");

        // Apply black and white filter
        myImage = new BlackAndWhiteDecorator(myImage);

        // Apply contrast adjustment
        myImage = new ContrastDecorator(myImage, 5);

        // Apply blur effect
        myImage = new BlurDecorator(myImage, 10);

        // Finally, apply all effects
        myImage.apply();
    }
}
