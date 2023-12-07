package com.healingcamp.app.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import com.healingcamp.app.domain.CampDto;
import com.healingcamp.app.domain.Camp_reviewDto;
import com.healingcamp.app.domain.ItemDto;
import com.healingcamp.app.service.MainlistServiece;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Autowired
	MainlistServiece mainlistServiece;

	@GetMapping("/") // ?keyword=핑장&type=강원도&offset=10&pageSize=10
	public String c_list(Integer offset, Integer pageSize, Model model) {
		if(offset == null) offset = 0;
		if(pageSize == null) pageSize = 4;

		Map map = new HashMap<>();
		map.put("offset", offset);
		map.put("pageSize", pageSize);

		List<CampDto> c_list = mainlistServiece.getCampAll(map);
		List<ItemDto> i_list = mainlistServiece.itemMainlist(map);

		model.addAttribute("campMainlist", c_list);
		model.addAttribute("i_list", i_list);

		return "index";
	}
}
