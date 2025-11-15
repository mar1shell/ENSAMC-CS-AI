package workshops.Workshop_2.exo3;

public abstract class ImageDecorator implements Image {
    protected Image decoratedImage;

    public ImageDecorator(Image decoratedImage) {
        this.decoratedImage = decoratedImage;
    }

    @Override
    public void apply() {
        decoratedImage.apply();
    }
    
}
