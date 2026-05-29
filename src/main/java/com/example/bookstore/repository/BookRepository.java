package com.example.bookstore.repository;

import com.example.bookstore.model.Book;
import com.example.bookstore.model.Category;
import com.example.bookstore.model.Author; // Import Author
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BookRepository extends JpaRepository<Book, Long> {
    List<Book> findByCategory(Category category);
    List<Book> findByAuthor(Author author); // New method to find books by Author
}
