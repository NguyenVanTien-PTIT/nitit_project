package com.niit.nitit_project.model.response;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class StatisticBrand {
    private Integer idBrand;
    private String nameBrand;
    private int totalWatch;
}
