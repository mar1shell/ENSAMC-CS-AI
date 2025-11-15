package workshops.Workshop_2.exo3;

public class BlurDecorator extends ImageDecorator {
    private int blurRadius;

    public BlurDecorator(Image decoratedImage, int blurRadius) {
        super(decoratedImage);
        this.blurRadius = blurRadius;
    }

    @Override
    public void apply() {
        super.apply();
        System.out.println("Applying blur with radius: " + blurRadius);
    }
    
}
