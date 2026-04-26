package com.yourteam.grocerymanagement.model;

public class User {

    private String userId;
    private String password;
    private String email;
    private String role; // "ADMIN" or "CUSTOMER"

    // Constructor
    public User(String userId, String password, String email, String role) {
        this.userId = userId;
        this.password = password;
        this.email = email;
        this.role = role;
    }

    // Default constructor
    public User() {}

    // Getters and Setters
    public String getUserId() { return userId; }
    public void setUserId(String userId) { this.userId = userId; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }

    // authenticate method
    public boolean authenticate(String username, String password) {
        return this.userId.equals(username) && this.password.equals(password);
    }

    // Convert to file format
    public String toFileString() {
        return userId + "," + password + "," + email + "," + role;
    }

    // Convert from file format
    public static User fromFileString(String line) {
        String[] parts = line.split(",");
        return new User(parts[0], parts[1], parts[2], parts[3]);
    }

    @Override
    public String toString() {
        return "User{userId='" + userId + "', email='" + email + "', role='" + role + "'}";
    }
}

