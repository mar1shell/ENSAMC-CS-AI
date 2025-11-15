package workshops.Workshop_2.exo3;

public class BrightnessDecorator extends ImageDecorator {
    private int brightnessLevel;

    public BrightnessDecorator(Image decoratedImage, int brightnessLevel) {
        super(decoratedImage);
        this.brightnessLevel = brightnessLevel;
    }

    @Override
    public void apply() {
        super.apply();
        System.out.println("Adjusting brightness by level: " + brightnessLevel);
    }
    
}
