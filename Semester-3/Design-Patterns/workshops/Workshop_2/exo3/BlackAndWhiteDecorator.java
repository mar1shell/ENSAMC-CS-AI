package workshops.Workshop_2.exo3;

public class BlackAndWhiteDecorator extends ImageDecorator {

    public BlackAndWhiteDecorator(Image decoratedImage) {
        super(decoratedImage);
    }

    @Override
    public void apply() {
        super.apply();
        System.out.println("Converting image to black and white.");
    }
    
}