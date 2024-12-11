package com.example.asm_java5.controller;

import com.example.asm_java5.entity.DanhMuc;
import com.example.asm_java5.repo.DanhMucRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;

@Controller
@RequestMapping("/danhmucs")
public class DanhMucConTroller {

    @Autowired
    private DanhMucRepository danhMucRepository;

    @GetMapping("/")
    public ModelAndView show(Model model) {
        model.addAttribute("listDanhMuc", danhMucRepository.findAll());
        return new ModelAndView("DanhMuc/home","DanhMuc",new DanhMuc());
    }

    @PostMapping("/")
    public ModelAndView save(@ModelAttribute("DanhMuc") DanhMuc danhMuc) {
        danhMuc.setNgayTao(new Date().toInstant());
        danhMucRepository.save(danhMuc);
        return new ModelAndView("redirect:/danhmucs/","DanhMuc",new DanhMuc());
    }

    @DeleteMapping("/{id}")
    public ModelAndView delete(@PathVariable Integer id) {
        danhMucRepository.deleteById(id);
        return new ModelAndView("redirect:/danhmucs/","DanhMuc",new DanhMuc());
    }

    @GetMapping("/{id}")
    public ModelAndView edit(@PathVariable Integer id,@ModelAttribute("DanhMuc1") DanhMuc danhMuc) {
        DanhMuc danhMuc1 = danhMucRepository.findById(id).get();
        return new ModelAndView("DanhMuc/update","DanhMuc1",danhMuc1);
    }

    @PostMapping("/{id}")
    public ModelAndView update(@PathVariable Integer id,@ModelAttribute("DanhMuc1") DanhMuc danhMuc){
        danhMuc.setNgayTao(danhMucRepository.findById(id).get().getNgayTao());
        danhMuc.setNgaySua(new Date().toInstant());
        danhMucRepository.save(danhMuc);
        return new ModelAndView("redirect:/danhmucs/","DanhMuc",new DanhMuc());
    }
}
