package com.chronic.controller;

import com.chronic.common.Result;
import com.chronic.entity.TimeDimension;
import com.chronic.service.TimeDimensionService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 时间维度控制器
 *
 * @author chronic
 */
@Api(tags = "时间维度管理")
@RestController
@RequestMapping("/api/time")
@RequiredArgsConstructor
public class TimeDimensionController {

    private final TimeDimensionService timeDimensionService;

    @ApiOperation("获取所有年份列表")
    @GetMapping("/years")
    public Result<List<Integer>> getYears() {
        List<Integer> years = timeDimensionService.getYearList();
        return Result.success(years);
    }

    @ApiOperation("根据年份获取季度列表")
    @GetMapping("/quarters/{year}")
    public Result<List<TimeDimension>> getQuarters(
            @ApiParam("年份") @PathVariable Integer year) {
        List<TimeDimension> quarters = timeDimensionService.getQuarterListByYear(year);
        return Result.success(quarters);
    }

    @ApiOperation("根据ID获取时间维度详情")
    @GetMapping("/{id}")
    public Result<TimeDimension> getById(@PathVariable Long id) {
        TimeDimension time = timeDimensionService.getById(id);
        return Result.success(time);
    }
}
