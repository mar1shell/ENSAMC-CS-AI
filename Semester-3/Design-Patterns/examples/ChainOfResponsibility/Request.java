package ChainOfResponsibility;

public class Request {
    private String username;
    private String password;
    private ETypes type;
    private ERole role;
    private int amount;

    public Request(String username, String password, ETypes type, ERole role, int amount) {
        this.username = username;
        this.password = password;
        this.type = type;
        this.role = role;
        this.amount = amount;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public ETypes getType() {
        return type;
    }

    public ERole getRole() {
        return role;
    }

    public int getAmount() {
        return amount;
    }
}
