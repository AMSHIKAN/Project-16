package com.yourteam.grocerymanagement.model;

public class Admin extends User {

    private String adminLevel;

    // Constructor
    public Admin(String userId, String password, String email, String adminLevel) {
        super(userId, password, email, "ADMIN");
        this.adminLevel = adminLevel;
    }

    // Default constructor
    public Admin() {
        super();
    }

    // Getter and Setter
    public String getAdminLevel() { return adminLevel; }
    public void setAdminLevel(String adminLevel) { this.adminLevel = adminLevel; }

    // Override toFileString
    @Override
    public String toFileString() {
        return getUserId() + "," + getPassword() + "," + getEmail() + ",ADMIN," + adminLevel;
    }

    // Override fromFileString
    public static Admin fromFileString(String line) {
        String[] parts = line.split(",");
        return new Admin(parts[0], parts[1], parts[2], parts.length > 4 ? parts[4] : "BASIC");
    }

    @Override
    public String toString() {
        return "Admin{userId='" + getUserId() + "', email='" + getEmail() + "', adminLevel='" + adminLevel + "'}";
    }
}