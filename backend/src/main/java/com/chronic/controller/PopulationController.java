package com.chronic.controller;

import com.chronic.common.Result;
import com.chronic.entity.Population;
import com.chronic.service.PopulationService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 人群维度控制器
 *
 * @author chronic
 */
@Api(tags = "人群维度管理")
@RestController
@RequestMapping("/api/population")
@RequiredArgsConstructor
public class PopulationController {

    private final PopulationService populationService;

    @ApiOperation("获取所有年龄段列表")
    @GetMapping("/age-groups")
    public Result<List<String>> getAgeGroups() {
        List<String> ageGroups = populationService.getAgeGroupList();
        return Result.success(ageGroups);
    }

    @ApiOperation("获取所有性别列表")
    @GetMapping("/genders")
    public Result<List<Population>> getGenders() {
        List<Population> genders = populationService.getGenderList();
        return Result.success(genders);
    }

    @ApiOperation("根据ID获取人群维度详情")
    @GetMapping("/{id}")
    public Result<Population> getById(@PathVariable Long id) {
        Population population = populationService.getById(id);
        return Result.success(population);
    }
}
