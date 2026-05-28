package com.example.bookstore.service;

import com.example.bookstore.model.Book;
import com.example.bookstore.repository.BookRepository;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookService {

    @Autowired
    private BookRepository bookRepository;

    public List<Book> getAllBooks() {
        return bookRepository.findAll();
    }

    @PostConstruct
    public void initData() {
        if (bookRepository.count() == 0) {
            bookRepository.save(new Book("Bản Đồ Thiên Hà", "Elena Vance", 245000.0, 320000.0, "https://lh3.googleusercontent.com/aida-public/AB6AXuA7wrUg_LnHQo_RDmPALIuNYdoHFGujYAKoh4CntkYmkAfH4F4n42WzSL5RNOSG76ISD-GV36npUZnVFfe0p3LqVtaAYgGL3CT147VE4TBkFg2SQ0sIP8A83OyGIq-u8xdoQ_maKQoHiRLTI9K2MCVEsWr4P92trylgZZ7tG6FoZYl42OuAIP1rbfTtFM3PgYhwvRG-Q2Z7qIi4iagOjiPf6u-mxzibqoT96AgH5-mQTfZGTj0nEvWEjesFNCceHlXOH0It2xuCP8D2", "NEW"));
            bookRepository.save(new Book("Mùa Trong Tâm Hồn", "Minh Nhật", 189000.0, null, "https://lh3.googleusercontent.com/aida-public/AB6AXuAEVeJq03ZUKo8_QILAHvzsgll1ed4afKgTo179WYTpVykFmC_nh6ecQF39uheuIDjMRd9Nksr4Qdu8KsW_7Ulf1da7zR_ueMEaNY4vAUTpwyEvqU-cxstVL-3nPbEPqQjioqRiuL9ZS0zCgrtomPOVDtikKKsg5R8t9ETvOsNjBb--tC6OI6X8stbBpoZ_wIBXK8edkZ8XjptPw1QRWPBNJXDGrQr1VVBPL18wjYW7RT55bAbAM7iOtlX4rJbvyChT912ryYqyl0Jb", "NEW"));
            bookRepository.save(new Book("Tiếng Vọng Đỏ", "Arthur Thorne", 210000.0, null, "https://lh3.googleusercontent.com/aida-public/AB6AXuC9fWbpSl6Yw03a6radvbIE-rpf95F_VwniwOh3cAduECNqLmKu4E_n-qIQcjdQzVLmERb4TUY4jDwEU33PrvA3aamVsUGXH-u7QKcwiwBs2niJlMb9xBEWfpTWJnQ5Y3xcyFX6PDQeZqEotY1A7xPZNp4r1SN-cAxXlKEGzyvFv5vFn7EKzuGaqUuQHyLuRx1UIB23mnu8j7JLEHL67fmJ93pajH7YhxSJZ8-mltEwvXpVkPJHHj-7q194V6kXV33JXWoUuJ4Ix6zT", "NEW"));
            bookRepository.save(new Book("Sâu Trong Khu Rừng", "Linh Lan", 155000.0, null, "https://lh3.googleusercontent.com/aida-public/AB6AXuA5kXl6rVkglyE2B1vNGxuH0boPFB1lKphMYLui5mVan22AXpAeQnmFSjCDavz779lS8FMn9VHzCg3-bFJQMI77q0-OUlGKjGecDBSSj0R51cBhl9y5Z5U_USdTnf5zBVPvftn4tQCUOUfZdytisg6lEwI9SgXkw742H6uWpepH6LwNLN8mVZ7GyXSnca1zRRh7keeJqwVoBcEVWDNqgJhkziqgop_TZsZEhP_4CFjvfXp5B6pAxQ5b-o16vbr9R17Yo5rwCDfxyzYb", "NEW"));
        }
    }
}
