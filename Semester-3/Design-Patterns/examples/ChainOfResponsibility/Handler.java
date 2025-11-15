package ChainOfResponsibility;

public interface Handler {
    void setNext(Handler handler);
    void handleRequest(Request request);
}
