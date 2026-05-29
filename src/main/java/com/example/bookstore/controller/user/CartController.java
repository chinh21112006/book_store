package com.example.bookstore.controller.user;

import com.example.bookstore.model.Book;
import com.example.bookstore.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model; // Import Model
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpSession; // Changed from javax.servlet.http.HttpSession
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;
import java.util.LinkedHashMap; // To maintain insertion order for cart display

@Controller
public class CartController {

    @Autowired
    private BookService bookService;

    @GetMapping("/cart")
    public String viewCart(HttpSession session, Model model) { // Add HttpSession and Model
        Map<Long, Integer> cart = (Map<Long, Integer>) session.getAttribute("cart");
        Map<Book, Integer> cartItems = new LinkedHashMap<>(); // Use LinkedHashMap to preserve order

        if (cart != null && !cart.isEmpty()) {
            for (Map.Entry<Long, Integer> entry : cart.entrySet()) {
                Long bookId = entry.getKey();
                Integer quantity = entry.getValue();
                Optional<Book> bookOptional = bookService.getBookById(bookId);
                bookOptional.ifPresent(book -> cartItems.put(book, quantity));
            }
        }
        model.addAttribute("cartItems", cartItems);
        // Trả về file: /WEB-INF/views/user/cart.jsp
        return "user/cart";
    }

    @PostMapping("/cart/add")
    public String addToCart(@RequestParam("bookId") Long bookId, HttpSession session, RedirectAttributes redirectAttributes) {
        Map<Long, Integer> cart = (Map<Long, Integer>) session.getAttribute("cart");
        if (cart == null) {
            cart = new HashMap<>();
        }

        Optional<Book> bookOptional = bookService.getBookById(bookId);
        if (bookOptional.isPresent()) {
            cart.put(bookId, cart.getOrDefault(bookId, 0) + 1);
            session.setAttribute("cart", cart);
            redirectAttributes.addFlashAttribute("successMessage", "Sách đã được thêm vào giỏ hàng!");
        } else {
            redirectAttributes.addFlashAttribute("errorMessage", "Không tìm thấy sách để thêm vào giỏ hàng!");
        }

        return "redirect:/home"; // Chuyển hướng về trang chủ sau khi thêm
    }

    @PostMapping("/cart/update")
    public String updateCartItem(@RequestParam("bookId") Long bookId,
                                 @RequestParam("quantity") int quantity,
                                 HttpSession session,
                                 RedirectAttributes redirectAttributes) {
        Map<Long, Integer> cart = (Map<Long, Integer>) session.getAttribute("cart");
        if (cart == null) {
            cart = new HashMap<>(); // Should not happen if cart is already displayed
        }

        if (quantity <= 0) {
            cart.remove(bookId); // Remove item if quantity is 0 or less
            redirectAttributes.addFlashAttribute("infoMessage", "Sách đã được xóa khỏi giỏ hàng.");
        } else {
            Optional<Book> bookOptional = bookService.getBookById(bookId);
            if (bookOptional.isPresent()) {
                cart.put(bookId, quantity);
                redirectAttributes.addFlashAttribute("successMessage", "Số lượng sách đã được cập nhật.");
            } else {
                redirectAttributes.addFlashAttribute("errorMessage", "Không tìm thấy sách để cập nhật!");
            }
        }
        session.setAttribute("cart", cart);
        return "redirect:/cart"; // Redirect back to cart page
    }

    @PostMapping("/cart/remove")
    public String removeCartItem(@RequestParam("bookId") Long bookId,
                                 HttpSession session,
                                 RedirectAttributes redirectAttributes) {
        Map<Long, Integer> cart = (Map<Long, Integer>) session.getAttribute("cart");
        if (cart != null) {
            cart.remove(bookId);
            session.setAttribute("cart", cart);
            redirectAttributes.addFlashAttribute("infoMessage", "Sách đã được xóa khỏi giỏ hàng.");
        }
        return "redirect:/cart"; // Redirect back to cart page
    }

    @PostMapping("/cart/clear")
    public String clearCart(HttpSession session, RedirectAttributes redirectAttributes) {
        session.removeAttribute("cart"); // Remove the entire cart from the session
        redirectAttributes.addFlashAttribute("infoMessage", "Giỏ hàng của bạn đã được làm trống.");
        return "redirect:/cart"; // Redirect back to cart page
    }
}
