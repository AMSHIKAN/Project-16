package com.yourteam.grocerymanagement.servlet;

import com.yourteam.grocerymanagement.model.Customer;
import com.yourteam.grocerymanagement.model.User;
import com.yourteam.grocerymanagement.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/users")
public class UserController {

    @Autowired
    private UserService userService;

    // Home page
    @GetMapping("/")
    public String home() {
        return "redirect:/users/login";
    }

    // Show login page
    @GetMapping("/login")
    public String showLoginPage() {
        return "login";
    }

    // Handle login
    @PostMapping("/login")
    public String login(@RequestParam String userId,
                        @RequestParam String password,
                        Model model) {
        User user = userService.authenticateUser(userId, password);
        if (user != null) {
            model.addAttribute("user", user);
            return "dashboard";
        } else {
            model.addAttribute("error", "Invalid username or password!");
            return "login";
        }
    }

    // Show register page
    @GetMapping("/register")
    public String showRegisterPage() {
        return "register";
    }

    // Handle registration
    @PostMapping("/register")
    public String register(@RequestParam String userId,
                           @RequestParam String password,
                           @RequestParam String email,
                           @RequestParam String customerName,
                           @RequestParam String phoneNumber,
                           @RequestParam String address,
                           Model model) {
        Customer customer = new Customer(userId, password, email,
                customerName, phoneNumber, address);
        boolean success = userService.registerUser(customer);
        if (success) {
            model.addAttribute("message", "Registration successful! Please login.");
            return "login";
        } else {
            model.addAttribute("error", "Registration failed. Please try again.");
            return "register";
        }
    }

    // Show all users
    @GetMapping("/list")
    public String listUsers(Model model) {
        model.addAttribute("users", userService.getAllUsers());
        return "users";
    }

    // Show update page
    @GetMapping("/update/{userId}")
    public String showUpdatePage(@PathVariable String userId, Model model) {
        User user = userService.getUserById(userId);
        model.addAttribute("user", user);
        return "update";
    }

    // Handle update
    @PostMapping("/update")
    public String updateUser(@RequestParam String userId,
                             @RequestParam String password,
                             @RequestParam String email,
                             @RequestParam String customerName,
                             @RequestParam String phoneNumber,
                             @RequestParam String address,
                             Model model) {
        Customer customer = new Customer(userId, password, email,
                customerName, phoneNumber, address);
        boolean success = userService.updateUser(customer);
        if (success) {
            model.addAttribute("message", "User updated successfully!");
            model.addAttribute("users", userService.getAllUsers());
            return "users";
        } else {
            model.addAttribute("error", "Update failed!");
            return "update";
        }
    }

    // Handle delete
    @GetMapping("/delete/{userId}")
    public String deleteUser(@PathVariable String userId, Model model) {
        userService.deleteUser(userId);
        model.addAttribute("users", userService.getAllUsers());
        return "users";
    }
}