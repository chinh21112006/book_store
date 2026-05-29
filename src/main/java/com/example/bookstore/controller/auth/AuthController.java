package com.example.bookstore.controller.auth;

import com.example.bookstore.model.Book;
import com.example.bookstore.model.Category;
import com.example.bookstore.model.Author;
import com.example.bookstore.model.User;
import com.example.bookstore.model.Order;
import com.example.bookstore.model.Address; // Import Address model
import com.example.bookstore.service.BookService;
import com.example.bookstore.service.CategoryService;
import com.example.bookstore.service.AuthorService;
import com.example.bookstore.service.UserService;
import com.example.bookstore.service.OrderService;
import com.example.bookstore.service.AddressService; // Import AddressService
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpSession;
import java.util.List;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.Map;
import java.util.LinkedHashMap;
import java.util.HashMap;

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

    @Autowired
    private OrderService orderService;

    @Autowired
    private AddressService addressService; // Inject AddressService

    @ModelAttribute("loggedInUser")
    public User getLoggedInUser() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && authentication.getPrincipal() instanceof UserDetails) {
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            return userService.findByEmail(userDetails.getUsername());
        }
        return null;
    }

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
        User loggedInUser = getLoggedInUser();
        if (loggedInUser != null) {
            Set<Long> favoriteBookIds = userService.getFavoriteBooks(loggedInUser).stream()
                                                .map(Book::getId)
                                                .collect(Collectors.toSet());
            model.addAttribute("favoriteBookIds", favoriteBookIds);
        }
        return "user/home/home";
    }

    @GetMapping("/books/{id}")
    public String bookDetailPage(@PathVariable("id") Long id, Model model) {
        Optional<Book> bookOptional = bookService.getBookById(id);
        if (bookOptional.isPresent()) {
            Book book = bookOptional.get();
            model.addAttribute("book", book);

            List<Book> allBooks = bookService.getAllBooks();
            List<Book> relatedBooks = allBooks.stream()
                                            .filter(b -> !b.getId().equals(id))
                                            .limit(4)
                                            .collect(Collectors.toList());
            model.addAttribute("relatedBooks", relatedBooks);

            User loggedInUser = getLoggedInUser();
            if (loggedInUser != null) {
                model.addAttribute("isFavorite", userService.isBookFavorite(loggedInUser, id));
            }

            return "user/books/book-detail";
        } else {
            return "redirect:/home";
        }
    }

    @GetMapping("/bestsellers")
    public String bestsellersPage(Model model) {
        model.addAttribute("bestsellers", bookService.getAllBooks());
        User loggedInUser = getLoggedInUser();
        if (loggedInUser != null) {
            Set<Long> favoriteBookIds = userService.getFavoriteBooks(loggedInUser).stream()
                                                .map(Book::getId)
                                                .collect(Collectors.toSet());
            model.addAttribute("favoriteBookIds", favoriteBookIds);
        }
        return "user/bestsellers/bestsellers";
    }

    @GetMapping("/categories")
    public String categoriesPage(Model model) {
        model.addAttribute("categories", categoryService.getAllCategories());
        return "user/categories/categories";
    }

    @GetMapping("/categories/{id}")
    public String booksByCategoryPage(@PathVariable("id") Long id, Model model) {
        Optional<Category> categoryOptional = categoryService.getCategoryById(id);
        if (categoryOptional.isPresent()) {
            Category category = categoryOptional.get();
            model.addAttribute("category", category);
            model.addAttribute("books", bookService.getBooksByCategory(category));
            User loggedInUser = getLoggedInUser();
            if (loggedInUser != null) {
                Set<Long> favoriteBookIds = userService.getFavoriteBooks(loggedInUser).stream()
                                                    .map(Book::getId)
                                                    .collect(Collectors.toSet());
                model.addAttribute("favoriteBookIds", favoriteBookIds);
            }
            return "user/categories/books-by-category";
        } else {
            return "redirect:/categories";
        }
    }

    @GetMapping("/authors")
    public String authorsPage(Model model) {
        model.addAttribute("authors", authorService.getAllAuthors());
        return "user/authors/authors";
    }

    @GetMapping("/authors/{id}")
    public String booksByAuthorPage(@PathVariable("id") Long id, Model model) {
        Optional<Author> authorOptional = authorService.getAuthorById(id);
        if (authorOptional.isPresent()) {
            Author author = authorOptional.get();
            model.addAttribute("author", author);
            model.addAttribute("books", bookService.getBooksByAuthor(author));
            User loggedInUser = getLoggedInUser();
            if (loggedInUser != null) {
                Set<Long> favoriteBookIds = userService.getFavoriteBooks(loggedInUser).stream()
                                                    .map(Book::getId)
                                                    .collect(Collectors.toSet());
                model.addAttribute("favoriteBookIds", favoriteBookIds);
            }
            return "user/authors/books-by-author";
        } else {
            return "redirect:/authors";
        }
    }

    @GetMapping("/cart")
    public String viewCart(HttpSession session, Model model) {
        Map<Long, Integer> cart = (Map<Long, Integer>) session.getAttribute("cart");
        Map<Book, Integer> cartItems = new LinkedHashMap<>();

        if (cart != null && !cart.isEmpty()) {
            for (Map.Entry<Long, Integer> entry : cart.entrySet()) {
                Long bookId = entry.getKey();
                Integer quantity = entry.getValue();
                Optional<Book> bookOptional = bookService.getBookById(bookId);
                bookOptional.ifPresent(book -> cartItems.put(book, quantity));
            }
        }
        model.addAttribute("cartItems", cartItems);
        return "user/cart/cart";
    }

    @PostMapping("/cart/add")
    public String addBookToCart(@RequestParam("bookId") Long bookId,
                                @RequestParam(value = "quantity", defaultValue = "1") int quantity,
                                HttpSession session,
                                RedirectAttributes redirectAttributes) {
        Map<Long, Integer> cart = (Map<Long, Integer>) session.getAttribute("cart");
        if (cart == null) {
            cart = new LinkedHashMap<>();
            session.setAttribute("cart", cart);
        }

        cart.merge(bookId, quantity, Integer::sum); // Add quantity to existing or put new

        redirectAttributes.addFlashAttribute("successMessage", "Sách đã được thêm vào giỏ hàng!");
        return "redirect:/cart"; // Redirect to cart page or wherever appropriate
    }

    @GetMapping("/new-books")
    public String newBooksPage(Model model) {
        model.addAttribute("newBooks", bookService.getNewestBooks());
        User loggedInUser = getLoggedInUser();
        if (loggedInUser != null) {
            Set<Long> favoriteBookIds = userService.getFavoriteBooks(loggedInUser).stream()
                                                .map(Book::getId)
                                                .collect(Collectors.toSet());
            model.addAttribute("favoriteBookIds", favoriteBookIds);
        }
        return "user/new-books/new-books";
    }

    @GetMapping("/profile")
    public String profilePage(Model model) {
        model.addAttribute("user", getLoggedInUser());
        return "user/profile/profile";
    }

    @PostMapping("/profile/update")
    public String updateProfile(@ModelAttribute("user") User user, RedirectAttributes redirectAttributes) {
        userService.updateProfile(user);
        redirectAttributes.addFlashAttribute("successMessage", "Cập nhật thông tin thành công!");
        return "redirect:/profile";
    }

    @GetMapping("/profile/orders")
    public String myOrdersPage(Model model) {
        User loggedInUser = getLoggedInUser();
        if (loggedInUser != null) {
            List<Order> orders = orderService.getOrdersByUser(loggedInUser);
            model.addAttribute("orders", orders);
            model.addAttribute("user", loggedInUser);
            return "user/profile/orders";
        }
        return "redirect:/login";
    }

    @GetMapping("/profile/notifications")
    public String myNotificationsPage(Model model) {
        User loggedInUser = getLoggedInUser();
        if (loggedInUser != null) {
            model.addAttribute("user", loggedInUser);
            return "user/profile/notifications";
        }
        return "redirect:/login";
    }

    @GetMapping("/profile/wishlist")
    public String myWishlistPage(Model model) {
        User loggedInUser = getLoggedInUser();
        if (loggedInUser != null) {
            Set<Book> favoriteBooks = userService.getFavoriteBooks(loggedInUser);
            model.addAttribute("favoriteBooks", favoriteBooks);
            model.addAttribute("user", loggedInUser);
            return "user/profile/wishlist";
        }
        return "redirect:/login";
    }

    // New AJAX endpoint for toggling favorite status
    @PostMapping("/api/wishlist/toggle/{bookId}")
    @ResponseBody
    public ResponseEntity<?> toggleFavoriteBook(@PathVariable("bookId") Long bookId, Authentication authentication) {
        if (authentication == null || !(authentication.getPrincipal() instanceof UserDetails)) {
            return new ResponseEntity<>("Unauthorized", HttpStatus.UNAUTHORIZED);
        }
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        User loggedInUser = userService.findByEmail(userDetails.getUsername());

        if (loggedInUser == null) {
            return new ResponseEntity<>("User not found", HttpStatus.NOT_FOUND);
        }

        boolean isFavorite = userService.isBookFavorite(loggedInUser, bookId);
        if (isFavorite) {
            userService.removeBookFromFavorites(loggedInUser, bookId);
            isFavorite = false;
        } else {
            userService.addBookToFavorites(loggedInUser, bookId);
            isFavorite = true;
        }

        Map<String, Object> response = new HashMap<>();
        response.put("isFavorite", isFavorite);
        response.put("message", isFavorite ? "Sách đã được thêm vào danh sách yêu thích!" : "Sách đã được xóa khỏi danh sách yêu thích!");
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    // --- Address Management ---

    @GetMapping("/profile/addresses")
    public String myAddressesPage(Model model) {
        User loggedInUser = getLoggedInUser();
        if (loggedInUser == null) {
            return "redirect:/login";
        }
        model.addAttribute("user", loggedInUser);
        model.addAttribute("addresses", addressService.getAddressesByUser(loggedInUser));
        return "user/profile/addresses";
    }

    @GetMapping("/profile/addresses/add")
    public String addAddressPage(Model model) {
        User loggedInUser = getLoggedInUser();
        if (loggedInUser == null) {
            return "redirect:/login";
        }
        model.addAttribute("address", new Address());
        model.addAttribute("user", loggedInUser);
        return "user/profile/address-form"; // Create a new JSP for the form
    }

    @PostMapping("/profile/addresses/add")
    public String saveAddress(@ModelAttribute("address") Address address, RedirectAttributes redirectAttributes) {
        User loggedInUser = getLoggedInUser();
        if (loggedInUser == null) {
            return "redirect:/login";
        }
        address.setUser(loggedInUser);
        addressService.saveAddress(address);
        redirectAttributes.addFlashAttribute("successMessage", "Địa chỉ đã được lưu thành công!");
        return "redirect:/profile/addresses";
    }

    @GetMapping("/profile/addresses/edit/{id}")
    public String editAddressPage(@PathVariable("id") Long id, Model model, RedirectAttributes redirectAttributes) {
        User loggedInUser = getLoggedInUser();
        if (loggedInUser == null) {
            return "redirect:/login";
        }
        Optional<Address> addressOptional = addressService.getAddressByIdAndUser(id, loggedInUser);
        if (addressOptional.isPresent()) {
            model.addAttribute("address", addressOptional.get());
            model.addAttribute("user", loggedInUser);
            return "user/profile/address-form";
        } else {
            redirectAttributes.addFlashAttribute("errorMessage", "Không tìm thấy địa chỉ hoặc bạn không có quyền chỉnh sửa.");
            return "redirect:/profile/addresses";
        }
    }

    @PostMapping("/profile/addresses/edit/{id}")
    public String updateAddress(@PathVariable("id") Long id, @ModelAttribute("address") Address address, RedirectAttributes redirectAttributes) {
        User loggedInUser = getLoggedInUser();
        if (loggedInUser == null) {
            return "redirect:/login";
        }
        // Ensure the address belongs to the logged-in user and update it
        Optional<Address> existingAddressOptional = addressService.getAddressByIdAndUser(id, loggedInUser);
        if (existingAddressOptional.isPresent()) {
            Address existingAddress = existingAddressOptional.get();
            existingAddress.setRecipientName(address.getRecipientName());
            existingAddress.setPhoneNumber(address.getPhoneNumber());
            existingAddress.setStreetAddress(address.getStreetAddress());
            existingAddress.setCity(address.getCity());
            existingAddress.setState(address.getState());
            existingAddress.setZipCode(address.getZipCode());
            existingAddress.setIsDefault(address.getIsDefault()); // Changed from setDefault() to setIsDefault() and isDefault() to getIsDefault()

            addressService.saveAddress(existingAddress); // Save the updated address
            redirectAttributes.addFlashAttribute("successMessage", "Địa chỉ đã được cập nhật thành công!");
        } else {
            redirectAttributes.addFlashAttribute("errorMessage", "Không tìm thấy địa chỉ hoặc bạn không có quyền chỉnh sửa.");
        }
        return "redirect:/profile/addresses";
    }

    @PostMapping("/profile/addresses/delete/{id}")
    public String deleteAddress(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
        User loggedInUser = getLoggedInUser();
        if (loggedInUser == null) {
            return "redirect:/login";
        }
        addressService.deleteAddress(id, loggedInUser);
        redirectAttributes.addFlashAttribute("successMessage", "Địa chỉ đã được xóa thành công!");
        return "redirect:/profile/addresses";
    }

    @PostMapping("/profile/addresses/set-default/{id}")
    public String setDefaultAddress(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
        User loggedInUser = getLoggedInUser();
        if (loggedInUser == null) {
            return "redirect:/login";
        }
        addressService.setDefaultAddress(id, loggedInUser);
        redirectAttributes.addFlashAttribute("successMessage", "Địa chỉ mặc định đã được cập nhật!");
        return "redirect:/profile/addresses";
    }
}
