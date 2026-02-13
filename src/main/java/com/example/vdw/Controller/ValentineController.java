package com.example.vdw.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ValentineController {

    @GetMapping("/")
    public String home() {
        return "index";
    }

    @GetMapping("/warning")
    public String warning() {
        return "warning";
    }

    @GetMapping("/yes")
    public String yes() {
        return "yes";
    }
}
