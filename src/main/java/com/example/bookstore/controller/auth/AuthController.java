package com.example.bookstore.controller.auth;

import com.example.bookstore.model.Book;
import com.example.bookstore.model.Category;
import com.example.bookstore.model.Author;
import com.example.bookstore.model.User;
import com.example.bookstore.service.BookService;
import com.example.bookstore.service.CategoryService;
import com.example.bookstore.service.AuthorService;
import com.example.bookstore.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Controller
public class AuthController {

    @Autowired
    private UserService userService;

    @Autowired
    private BookService bookService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private AuthorService authorService;

    @GetMapping("/login")
    public String loginPage() {
        return "auth/login";
    }

    @GetMapping("/register")
    public String registerPage(Model model) {
        model.addAttribute("user", new User());
        return "auth/register";
    }

    @PostMapping("/register")
    public String registerUser(@ModelAttribute("user") User user, Model model) {
        if (userService.findByEmail(user.getEmail()) != null) {
            model.addAttribute("error", "Email đã tồn tại!");
            return "auth/register";
        }
        userService.saveUser(user);
        return "redirect:/login?registered=true";
    }

    @GetMapping("/home")
    public String homePage(Model model) {
        model.addAttribute("books", bookService.getAllBooks());
        return "home";
    }

    // Method to display book details
    @GetMapping("/books/{id}")
    public String bookDetailPage(@PathVariable("id") Long id, Model model) {
        Optional<Book> bookOptional = bookService.getBookById(id);
        if (bookOptional.isPresent()) {
            Book book = bookOptional.get();
            model.addAttribute("book", book);

            // Get all books and filter out the current book for related books
            List<Book> allBooks = bookService.getAllBooks();
            List<Book> relatedBooks = allBooks.stream()
                                            .filter(b -> !b.getId().equals(id))
                                            .limit(4) // Limit to 4 related books
                                            .collect(Collectors.toList());
            model.addAttribute("relatedBooks", relatedBooks);

            return "user/book-detail"; // Return view book-detail.jsp
        } else {
            // Handle case where book is not found, e.g., redirect to home or error page
            return "redirect:/home";
        }
    }

    // New method to display bestsellers page
    @GetMapping("/bestsellers")
    public String bestsellersPage(Model model) {
        model.addAttribute("bestsellers", bookService.getAllBooks()); // Assuming all books are bestsellers for now
        return "user/bestsellers"; // Trả về view bestsellers.jsp
    }

    // New method to display categories page
    @GetMapping("/categories")
    public String categoriesPage(Model model) {
        model.addAttribute("categories", categoryService.getAllCategories());
        return "user/categories"; // Trả về view categories.jsp
    }

    // New method to display books by category
    @GetMapping("/categories/{id}")
    public String booksByCategoryPage(@PathVariable("id") Long id, Model model) {
        Optional<Category> categoryOptional = categoryService.getCategoryById(id);
        if (categoryOptional.isPresent()) {
            Category category = categoryOptional.get();
            model.addAttribute("category", category);
            model.addAttribute("books", bookService.getBooksByCategory(category));
            return "user/books-by-category"; // Trả về view books-by-category.jsp
        } else {
            // Handle case where category is not found
            return "redirect:/categories";
        }
    }

    // New method to display authors page
    @GetMapping("/authors")
    public String authorsPage(Model model) {
        model.addAttribute("authors", authorService.getAllAuthors());
        return "user/authors"; // Trả về view authors.jsp
    }

    // New method to display books by author
    @GetMapping("/authors/{id}")
    public String booksByAuthorPage(@PathVariable("id") Long id, Model model) {
        Optional<Author> authorOptional = authorService.getAuthorById(id);
        if (authorOptional.isPresent()) {
            Author author = authorOptional.get();
            model.addAttribute("author", author);
            model.addAttribute("books", bookService.getBooksByAuthor(author));
            return "user/books-by-author"; // Trả về view books-by-author.jsp
        } else {
            // Handle case where author is not found
            return "redirect:/authors";
        }
    }
}
