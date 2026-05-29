package com.example.bookstore.model;

import jakarta.persistence.*;

@Entity
@Table(name = "books")
public class Book {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String title;

    @ManyToOne // Many books can be written by one author
    @JoinColumn(name = "author_id") // This will create an author_id column in the books table
    private Author author; // Changed from String to Author object

    private Double price;
    private Double oldPrice;

    @Column(columnDefinition = "TEXT")
    private String imageUrl;

    @Column(columnDefinition = "TEXT")
    private String description;

    @ManyToOne // Many books can belong to one category
    @JoinColumn(name = "category_id") // This will create a category_id column in the books table
    private Category category;

    // Constructors
    public Book() {}

    // Updated constructor to accept Author and Category objects
    public Book(String title, Author author, Double price, Double oldPrice, String imageUrl, String description, Category category) {
        this.title = title;
        this.author = author;
        this.price = price;
        this.oldPrice = oldPrice;
        this.imageUrl = imageUrl;
        this.description = description;
        this.category = category;
    }

    // Getters and Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    // Updated getter and setter for Author object
    public Author getAuthor() { return author; }
    public void setAuthor(Author author) { this.author = author; }

    public Double getPrice() { return price; }
    public void setPrice(Double price) { this.price = price; }
    public Double getOldPrice() { return oldPrice; }
    public void setOldPrice(Double oldPrice) { this.oldPrice = oldPrice; }
    public String getImageUrl() { return imageUrl; }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public Category getCategory() { return category; }
    public void setCategory(Category category) { this.category = category; }
}
