package workshops.Workshop_2.exo3;

public class BaseImage implements Image {
    private String filename;

    public BaseImage(String filename) {
        this.filename = filename;
    }

    @Override
    public void apply() {
        System.out.println("Applying base image from file: " + filename);
    }
    
}
