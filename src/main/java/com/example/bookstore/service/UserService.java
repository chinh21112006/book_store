package com.example.bookstore.service;

import com.example.bookstore.model.Book;
import com.example.bookstore.model.User;
import com.example.bookstore.repository.BookRepository;
import com.example.bookstore.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;
import java.util.Set;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private BookRepository bookRepository; // Inject BookRepository

    @Autowired
    private PasswordEncoder passwordEncoder;

    public void saveUser(User user) {
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setRole("USER"); // Mặc định là USER

        // Initialize firstName and lastName from fullName if available
        if (user.getFullName() != null && !user.getFullName().isEmpty()) {
            String[] nameParts = user.getFullName().split(" ", 2); // Split into at most 2 parts
            if (nameParts.length > 0) {
                user.setFirstName(nameParts[0]);
                if (nameParts.length > 1) {
                    user.setLastName(nameParts[1]);
                }
            }
        }
        userRepository.save(user);
    }

    public User findByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    public Optional<User> getUserById(Long id) {
        return userRepository.findById(id);
    }

    // UPDATED method to update user profile safely
    public User updateProfile(User updatedUser) {
        Optional<User> existingUserOptional = userRepository.findById(updatedUser.getId());

        if (existingUserOptional.isPresent()) {
            User existingUser = existingUserOptional.get();

            // Update only allowed fields from updatedUser to existingUser
            existingUser.setFirstName(updatedUser.getFirstName());
            existingUser.setLastName(updatedUser.getLastName());
            existingUser.setDateOfBirth(updatedUser.getDateOfBirth());
            existingUser.setPhoneNumber(updatedUser.getPhoneNumber());
            existingUser.setBio(updatedUser.getBio());
            existingUser.setProfileImageUrl(updatedUser.getProfileImageUrl());
            // Do NOT update password or role from here

            // Save the updated existing user
            return userRepository.save(existingUser);
        } else {
            // Handle case where user is not found (e.g., throw an exception or return null)
            // For now, we'll just return the updatedUser which won't be saved
            return null; // Or throw new UserNotFoundException("User with ID " + updatedUser.getId() + " not found");
        }
    }

    @Transactional
    public void addBookToFavorites(User user, Long bookId) {
        Optional<Book> bookOptional = bookRepository.findById(bookId);
        if (bookOptional.isPresent()) {
            Book book = bookOptional.get();
            user.addFavoriteBook(book);
            userRepository.save(user);
        }
    }

    @Transactional
    public void removeBookFromFavorites(User user, Long bookId) {
        Optional<Book> bookOptional = bookRepository.findById(bookId);
        if (bookOptional.isPresent()) {
            Book book = bookOptional.get();
            user.removeFavoriteBook(book);
            userRepository.save(user);
        }
    }

    public boolean isBookFavorite(User user, Long bookId) {
        if (user == null || user.getFavoriteBooks() == null) {
            return false;
        }
        return user.getFavoriteBooks().stream().anyMatch(book -> book.getId().equals(bookId));
    }

    public Set<Book> getFavoriteBooks(User user) {
        // Ensure the favoriteBooks collection is initialized and loaded
        User managedUser = userRepository.findById(user.getId()).orElse(null);
        if (managedUser != null) {
            return managedUser.getFavoriteBooks();
        }
        return null;
    }
}
