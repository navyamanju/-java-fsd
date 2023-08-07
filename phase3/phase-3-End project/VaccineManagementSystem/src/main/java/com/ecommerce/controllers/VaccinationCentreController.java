package com.ecommerce.controllers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.ecommerce.repository.CitizenRepository;
import com.ecommerce.repository.VaccinationCentreRepository;
import com.ecommerce.entity.*;

import java.util.List;

@RestController
@RequestMapping("/vaccinationcentre")
public class VaccinationCentreController {

    @Autowired
    VaccinationCentreRepository vaccinationCentreRepository;

    @Autowired
    CitizenRepository citizenRepository;

    @GetMapping
    public ModelAndView showVaccinationCentres() {
        ModelAndView modelAndView = new ModelAndView("vaccinationcentre");
        List<VaccinationCentre> centres = vaccinationCentreRepository.findAll();
        modelAndView.addObject("vaccinecentre", centres);
        return modelAndView;
    }

    @GetMapping("/add-centre")
    public String showNewCentreForm(Model model) {
        List<String> cities = vaccinationCentreRepository.getAllCities();
        model.addAttribute("cities", cities);
        model.addAttribute("centre", new VaccinationCentre());
        return "newcentre";
    }

    @PostMapping("/add-centre")
    public String addCentre(@ModelAttribute("centre") VaccinationCentre centre) {
        vaccinationCentreRepository.save(centre);
        return "addsuccess";
    }

    @GetMapping("/edit-centre/{id}")
    public String showEditCentreForm(@PathVariable("id") Long id, Model model) {
        VaccinationCentre centre = vaccinationCentreRepository.findById(id).orElse(null);
        List<String> cities = vaccinationCentreRepository.getAllCities();
        model.addAttribute("centre", centre);
        model.addAttribute("cities", cities);
        return "editcentre";
    }

    @PostMapping("/edit-centre/{id}")
    public String editCentre(@ModelAttribute("centre") VaccinationCentre centre) {
        vaccinationCentreRepository.save(centre);
        return "updatesuccess";
    }

    @GetMapping("/delete-centre/{id}")
    public String deleteCentre(@PathVariable("id") Long id) {
        vaccinationCentreRepository.deleteById(id);
        return "deletesuccess";
    }

    @GetMapping("/view-centre/{id}")
    public String viewCentre(@PathVariable("id") Long id, Model model) {
        VaccinationCentre centre = vaccinationCentreRepository.findById(id).orElse(null);
        List<Citizen> citizens = citizenRepository.findAllById(id);
        model.addAttribute("centre", centre);
        model.addAttribute("citizens", citizens);
        return "view";
    }

    // Add the @ResponseBody annotation to indicate JSON response
    @ResponseBody
    @GetMapping("/api/vaccinationcentre/{id}")
    public VaccinationCentre getVaccinationCentreById(@PathVariable("id") Long id) {
        return vaccinationCentreRepository.findById(id).orElse(null);
    }
    @ResponseBody
    @GetMapping("/api/vaccinationcentre/all")
    public List<VaccinationCentre> getAllVaccinationCentres() {
        return vaccinationCentreRepository.findAll();
    }
    @DeleteMapping("/api/vaccinationcentre/{id}")
    public String deleteVaccinationCentreById(@PathVariable("id") Long id) {
        vaccinationCentreRepository.deleteById(id);
        return "Vaccination Centre with ID " + id + " has been deleted.";
    }
    @PutMapping("/api/vaccinationcentre/{id}")
    public VaccinationCentre updateVaccinationCentre(@PathVariable("id") Long id, @RequestBody VaccinationCentre centre) {
        VaccinationCentre existingCentre = vaccinationCentreRepository.findById(id).orElse(null);
        if (existingCentre != null) {
            existingCentre.setName(centre.getName());
            existingCentre.setCity(centre.getCity());
            // Set other attributes as needed
            return vaccinationCentreRepository.save(existingCentre);
        }
        return null; // If vaccination centre with given ID doesn't exist
    }
    @PostMapping("/api/vaccinationcentre")
    public VaccinationCentre createVaccinationCentre(@RequestBody VaccinationCentre centre) {
        return vaccinationCentreRepository.save(centre);
    }

    // Add other JSON API methods as needed
}

