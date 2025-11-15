package workshops.Workshop_2.exo3;

public class ContrastDecorator extends ImageDecorator {
    private int contrastLevel;

    public ContrastDecorator(Image decoratedImage, int contrastLevel) {
        super(decoratedImage);
        this.contrastLevel = contrastLevel;
    }

    @Override
    public void apply() {
        super.apply();
        System.out.println("Adjusting contrast by level: " + contrastLevel);
    }
    
}
