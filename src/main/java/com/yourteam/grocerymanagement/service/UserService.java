package com.yourteam.grocerymanagement.service;

import com.yourteam.grocerymanagement.model.Admin;
import com.yourteam.grocerymanagement.model.Customer;
import com.yourteam.grocerymanagement.model.User;
import org.springframework.stereotype.Service;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

@Service
public class UserService {

    private static final String FILE_PATH = "src/main/resources/data/users.txt";

    // CREATE - Register a new user
    public boolean registerUser(User user) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            writer.write(user.toFileString());
            writer.newLine();
            return true;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }

    // READ - Get all users
    public List<User> getAllUsers() {
        List<User> users = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = reader.readLine()) != null) {
                if (!line.trim().isEmpty()) {
                    String[] parts = line.split(",");
                    if (parts.length >= 4) {
                        if (parts[3].equals("ADMIN")) {
                            users.add(Admin.fromFileString(line));
                        } else {
                            users.add(Customer.fromFileString(line));
                        }
                    }
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return users;
    }

    // READ - Find user by ID
    public User getUserById(String userId) {
        List<User> users = getAllUsers();
        for (User user : users) {
            if (user.getUserId().equals(userId)) {
                return user;
            }
        }
        return null;
    }

    // UPDATE - Update user details
    public boolean updateUser(User updatedUser) {
        List<User> users = getAllUsers();
        boolean found = false;
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (User user : users) {
                if (user.getUserId().equals(updatedUser.getUserId())) {
                    writer.write(updatedUser.toFileString());
                    found = true;
                } else {
                    writer.write(user.toFileString());
                }
                writer.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return found;
    }

    // DELETE - Delete user by ID
    public boolean deleteUser(String userId) {
        List<User> users = getAllUsers();
        boolean found = false;
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (User user : users) {
                if (user.getUserId().equals(userId)) {
                    found = true;
                } else {
                    writer.write(user.toFileString());
                    writer.newLine();
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return found;
    }

    // AUTHENTICATE - Login
    public User authenticateUser(String userId, String password) {
        User user = getUserById(userId);
        if (user != null && user.authenticate(userId, password)) {
            return user;
        }
        return null;
    }
}
