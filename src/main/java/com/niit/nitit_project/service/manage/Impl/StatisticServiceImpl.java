package com.niit.nitit_project.service.manage.Impl;

import com.niit.nitit_project.entity.Watch;
import com.niit.nitit_project.model.dto.BrandDTO;
import com.niit.nitit_project.model.dto.StatisticBrand;
import com.niit.nitit_project.model.dto.WatchDTO;
import com.niit.nitit_project.repository.WatchRepository;
import com.niit.nitit_project.service.manage.StatisticService;
import com.niit.nitit_project.utils.DataUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.ArrayList;
import java.util.List;

@Service
public class StatisticServiceImpl implements StatisticService {
    @Autowired
    private WatchRepository watchRepository;

    @Override
    public Model loadPage(Model model) {
        //Lấy ds sản phẩm theo brand
        List<Object[]> objects = watchRepository.statisticByBrand();
        List<StatisticBrand> statisticBrands = new ArrayList<>();
        for(Object[] o : objects){
            StatisticBrand statisticBrand = new StatisticBrand();
            statisticBrand.setNameBrand(DataUtils.safeToString(o[0]));
            statisticBrand.setTotalWatch(DataUtils.safeToInt(o[1]));
            statisticBrands.add(statisticBrand);
        }
        model.addAttribute("statisticBrand", statisticBrands);
        //Lấy doanh thu theo tháng của
        return model;
    }
}
