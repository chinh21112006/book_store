package com.example.bookstore.dto;

import java.io.Serializable;

public class CartItem implements Serializable {
    private Long bookId;
    private String title;
    private String author;
    private Double price;
    private String imageUrl;
    private int quantity;

    public CartItem() {}

    public CartItem(Long bookId, String title, String author, Double price, String imageUrl, int quantity) {
        this.bookId = bookId;
        this.title = title;
        this.author = author;
        this.price = price;
        this.imageUrl = imageUrl;
        this.quantity = quantity;
    }

    public Double getTotalPrice() {
        return price * quantity;
    }

    // Getters and Setters
    public Long getBookId() { return bookId; }
    public void setBookId(Long bookId) { this.bookId = bookId; }
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }
    public String getAuthor() { return author; }
    public void setAuthor(String author) { this.author = author; }
    public Double getPrice() { return price; }
    public void setPrice(Double price) { this.price = price; }
    public String getImageUrl() { return imageUrl; }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }
    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }
}
