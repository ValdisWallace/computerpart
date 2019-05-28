package com.vadim.controller;

import com.vadim.entity.Part;
import com.vadim.exception.ResourceNotFoundException;
import com.vadim.service.PartService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/part")
public class PartController {

    private static final Logger LOG = LoggerFactory.getLogger(PartController.class);

    @Autowired
    private PartService partService;

    @GetMapping("/list")
    public String listParts(@RequestParam(value = "page", defaultValue = "1", required = false) int page,
                            @RequestParam(value = "filter", defaultValue = "0", required = false) int filter,
                            Model model) {
        Page<Part> pages = partService.getParts(page, filter);

        model.addAttribute("pages", pages);
        model.addAttribute("parts", pages.getContent());
        model.addAttribute("filter", filter);
        model.addAttribute("countTruePart", partService.getMinCountTruePart());

        return "list-parts";
    }

    @GetMapping("/search")
    public String searchPart(@RequestParam(value = "name", required = false) String name,
                             Model model) {
        Page<Part> part = partService.getSearchPart(name);

        model.addAttribute("pages", part);
        model.addAttribute("parts", part.getContent());
        model.addAttribute("filter", 0);
        model.addAttribute("countTruePart", partService.getMinCountTruePart());

        return "list-parts";
    }

    @GetMapping("/showForm")
    public String showFromForAdd(Model model) {
        LOG.debug("inside show customer-form handler method");
        Part part = new Part();
        model.addAttribute("part", part);
        return "part-form";
    }

    @PostMapping("/savePart")
    public String savePart(@ModelAttribute("part") Part part) {
        partService.savePart(part);
        return "redirect:/part/list";
    }

    @GetMapping("/updateForm")
    public String showFormForUpdate(@RequestParam("id") int id, Model model) throws ResourceNotFoundException {
        Part part = partService.getPart(id);
        model.addAttribute("part", part);
        return "part-form";
    }

    @GetMapping("/delete")
    public String deletePart(@RequestParam("id") int id) {
        partService.deletePart(id);
        return "redirect:/part/list";
    }
}
