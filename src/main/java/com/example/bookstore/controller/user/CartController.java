package com.example.bookstore.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CartController {

    @GetMapping("/cart")
    public String viewCart() {
        // Trả về file: /WEB-INF/views/user/cart.jsp
        return "user/cart";
    }
}
