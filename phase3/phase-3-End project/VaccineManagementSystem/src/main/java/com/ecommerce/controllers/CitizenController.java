package com.ecommerce.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ecommerce.entity.Citizen;
import com.ecommerce.entity.VaccinationCentre;
import com.ecommerce.repository.CitizenRepository;
import com.ecommerce.repository.VaccinationCentreRepository;
@RestController
@RequestMapping("/citizens")
//@Controller
public class CitizenController {

    @Autowired
     CitizenRepository citizenRepository;
    
    @Autowired 
	VaccinationCentreRepository vaccinationCentreRepository;
    
    @GetMapping
    public ModelAndView showCitizens() {
        ModelAndView modelAndView = new ModelAndView("citizens");
        List<Citizen> citizens = citizenRepository.findAll();
        int totalCitizens = citizens.size();
        modelAndView.addObject("citizens", citizens);
        modelAndView.addObject("totalCitizens", totalCitizens);
        return modelAndView;
    }



    @GetMapping("/add-citizen")
    public String showAddCitizenForm(Model model) {
        List<String> cities = vaccinationCentreRepository.getAllCities();
        List<String> vaccineCentres= vaccinationCentreRepository.findAllCentres();
        model.addAttribute("cities", cities);
        model.addAttribute("vaccineCentres", vaccineCentres);
        model.addAttribute("centre", new VaccinationCentre());
        model.addAttribute("citizen", new Citizen());
        return "add-citizen";
    }
    
    @PostMapping("/add-citizen")
    public String addCitizen(@ModelAttribute("citizen") Citizen citizen) {
    	citizen.setNumberOfDoses(0);
        citizen.setVaccinationStatus("Not Vaccinated");

        citizenRepository.save(citizen);
        
        
        return "redirect:/citizensuccess";
    }
    
    @GetMapping("/citizensuccess")
    public String showCitizenSuccessPage() {
        return "citizensuccess";
    }
    
    
    @GetMapping("/edit-citizen/{id}")
    public String showEditCitizenForm(@PathVariable("id") Long id, Model model) {
        Citizen citizen = citizenRepository.findById(id).orElse(null);
       

        List<String> vaccineCentres = vaccinationCentreRepository.findAllCentres();
        List<String> cities = vaccinationCentreRepository.getAllCities();

        model.addAttribute("vaccineCentres", vaccineCentres);
        model.addAttribute("cities", cities);
        model.addAttribute("citizen", citizen);

        return "edit-citizen";
    }
    @PostMapping("/edit-citizen/{id}")
    public String editCitizen(@ModelAttribute("citizen") Citizen citizen) {
    	
    	if (citizen.getNumberOfDoses() == 1) {
            citizen.setVaccinationStatus("Partially Vaccinated");
        } else if (citizen.getNumberOfDoses() == 2) {
            citizen.setVaccinationStatus("Fully Vaccinated");
        } else {
            citizen.setVaccinationStatus("Not Vaccinated");
        }

        citizenRepository.save(citizen);
        
        return "editsuccess";
    }
    
	
    @GetMapping("/view-citizen/{id}")
    public String viewCitizen(@PathVariable("id") Long id, Model model) {
        Citizen citizen = citizenRepository.findById(id).orElse(null);
       
        model.addAttribute("citizen", citizen);
        return "citizenview";
    } 
    
    @GetMapping("/delete-citizen/{id}")
    public String deleteCitizen(@PathVariable("id") Long id) {
        citizenRepository.deleteById(id);
        return "citizendelete";
    }
    
    @ResponseBody
    @GetMapping("/api/citizens/{id}")
    public Citizen getCitizenById(@PathVariable("id") Long id) {
        return citizenRepository.findById(id).orElse(null);
    }
   

    @ResponseBody
        @GetMapping("/api/citizens/all")
        public List<Citizen> getAllCitizens() {
            return citizenRepository.findAll();
        }

        

        // Create a new citizen
        @PostMapping("/api/citizens")
        public Citizen createCitizen(@RequestBody Citizen citizen) {
            citizen.setNumberOfDoses(0);
            citizen.setVaccinationStatus("Not Vaccinated");
            return citizenRepository.save(citizen);
        }

        // Update an existing citizen by ID
        @PutMapping("/api/citizens/{id}")
        public Citizen updateCitizen(@PathVariable("id") Long id, @RequestBody Citizen updatedCitizen) {
            Citizen existingCitizen = citizenRepository.findById(id).orElse(null);
            if (existingCitizen != null) {
                existingCitizen.setName(updatedCitizen.getName());
                existingCitizen.setCity(updatedCitizen.getCity());
                // Set other attributes as needed
                citizenRepository.save(existingCitizen);
            }
            return existingCitizen;
        }

        // Delete a citizen by ID
        @DeleteMapping("/api/citizens/{id}")
        public String deleteCitizenById(@PathVariable("id") Long id) {
            citizenRepository.deleteById(id);
            return "Citizen with ID " + id + " has been deleted.";
        }
    }
 
