package com.niit.nitit_project.model.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class BrandDTO {
    private Integer id;
    private String name;
    private String location;
    private String introduce;
}
