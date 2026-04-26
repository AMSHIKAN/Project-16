package com.yourteam.grocerymanagement.model;

public class Customer extends User {

    private String customerName;
    private String phoneNumber;
    private String address;

    // Constructor
    public Customer(String userId, String password, String email,
                    String customerName, String phoneNumber, String address) {
        super(userId, password, email, "CUSTOMER");
        this.customerName = customerName;
        this.phoneNumber = phoneNumber;
        this.address = address;
    }

    // Default constructor
    public Customer() {
        super();
    }

    // Getters and Setters
    public String getCustomerName() { return customerName; }
    public void setCustomerName(String customerName) { this.customerName = customerName; }

    public String getPhoneNumber() { return phoneNumber; }
    public void setPhoneNumber(String phoneNumber) { this.phoneNumber = phoneNumber; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    // Override toFileString
    @Override
    public String toFileString() {
        return getUserId() + "," + getPassword() + "," + getEmail() +
                ",CUSTOMER," + customerName + "," + phoneNumber + "," + address;
    }

    // Override fromFileString
    public static Customer fromFileString(String line) {
        String[] parts = line.split(",");
        return new Customer(
                parts[0], parts[1], parts[2],
                parts.length > 4 ? parts[4] : "",
                parts.length > 5 ? parts[5] : "",
                parts.length > 6 ? parts[6] : ""
        );
    }

    @Override
    public String toString() {
        return "Customer{userId='" + getUserId() + "', name='" + customerName +
                "', email='" + getEmail() + "'}";
    }
}

