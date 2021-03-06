package com.niit.nitit_project.controller.manage;

import com.niit.nitit_project.service.manage.StatisticService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ManageHomeController {
    @Autowired
    private StatisticService statisticService;

    @GetMapping("/admin/home")
    public String loadManageHome(Model model){
        statisticService.loadPage(model);
        return "admin/home";
    }
}
