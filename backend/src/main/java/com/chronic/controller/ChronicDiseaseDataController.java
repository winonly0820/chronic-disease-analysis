package com.chronic.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.chronic.common.PageResult;
import com.chronic.common.Result;
import com.chronic.entity.ChronicDiseaseData;
import com.chronic.service.ChronicDiseaseDataService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * 慢性病数据控制器
 *
 * @author chronic
 */
@Api(tags = "慢性病数据管理")
@RestController
@RequestMapping("/api/disease")
@RequiredArgsConstructor
public class ChronicDiseaseDataController {

    private final ChronicDiseaseDataService chronicDiseaseDataService;

    /**
     * 分页查询慢性病数据
     *
     * 前端传参示例：
     * /api/disease/page?current=1&size=10&regionId=1&diseaseId=4&year=2024
     *
     * 注意：
     * 这里使用 year，不再使用 timeId。
     * 因为前端年份下拉框返回的是 2024、2023 这种年份数字，
     * 后端 Mapper 中会通过 t_time.year 进行筛选。
     */
    @ApiOperation("分页查询慢性病数据")
    @GetMapping("/page")
    public Result<PageResult<ChronicDiseaseData>> getPage(
            @ApiParam("页码") @RequestParam(defaultValue = "1") Integer current,
            @ApiParam("每页大小") @RequestParam(defaultValue = "10") Integer size,
            @ApiParam("地区ID") @RequestParam(required = false) Long regionId,
            @ApiParam("年份") @RequestParam(required = false) Integer year,
            @ApiParam("疾病ID") @RequestParam(required = false) Long diseaseId,
            @ApiParam("人群ID") @RequestParam(required = false) Long populationId) {

        Page<ChronicDiseaseData> page = new Page<>(current, size);

        ChronicDiseaseData query = new ChronicDiseaseData();
        query.setRegionId(regionId);
        query.setYear(year);
        query.setDiseaseId(diseaseId);
        query.setPopulationId(populationId);

        Page<ChronicDiseaseData> result = chronicDiseaseDataService.getPage(page, query);

        PageResult<ChronicDiseaseData> pageResult = PageResult.of(
                result.getTotal(),
                result.getRecords(),
                result.getCurrent(),
                result.getSize()
        );

        return Result.success(pageResult);
    }

    /**
     * 获取各省份患病率统计
     */
    @ApiOperation("获取各省份患病率统计")
    @GetMapping("/prevalence/province")
    public Result<List<Map<String, Object>>> getPrevalenceByProvince(
            @ApiParam("疾病编码") @RequestParam String diseaseCode,
            @ApiParam("年份") @RequestParam Integer year) {

        List<Map<String, Object>> data = chronicDiseaseDataService.getPrevalenceByProvince(diseaseCode, year);
        return Result.success(data);
    }

    /**
     * 获取患病率趋势数据
     */
    @ApiOperation("获取患病率趋势数据")
    @GetMapping("/prevalence/trend")
    public Result<List<Map<String, Object>>> getPrevalenceTrend(
            @ApiParam("地区ID") @RequestParam Long regionId,
            @ApiParam("疾病编码") @RequestParam String diseaseCode) {

        List<Map<String, Object>> data = chronicDiseaseDataService.getPrevalenceTrend(regionId, diseaseCode);
        return Result.success(data);
    }

    /**
     * 获取各年龄段患病率分布
     */
    @ApiOperation("获取各年龄段患病率分布")
    @GetMapping("/prevalence/age")
    public Result<List<Map<String, Object>>> getPrevalenceByAgeGroup(
            @ApiParam("地区ID") @RequestParam Long regionId,
            @ApiParam("疾病编码") @RequestParam String diseaseCode,
            @ApiParam("年份") @RequestParam Integer year) {

        List<Map<String, Object>> data = chronicDiseaseDataService.getPrevalenceByAgeGroup(regionId, diseaseCode, year);
        return Result.success(data);
    }

    /**
     * 获取各病种患病率对比
     */
    @ApiOperation("获取各病种患病率对比")
    @GetMapping("/comparison")
    public Result<List<Map<String, Object>>> getDiseaseComparison(
            @ApiParam("地区ID") @RequestParam Long regionId,
            @ApiParam("年份") @RequestParam Integer year) {

        List<Map<String, Object>> data = chronicDiseaseDataService.getDiseaseComparison(regionId, year);
        return Result.success(data);
    }

    /**
     * 获取全国患病率Top10
     */
    @ApiOperation("获取全国患病率Top10")
    @GetMapping("/top10")
    public Result<List<Map<String, Object>>> getTop10Prevalence(
            @ApiParam("疾病编码") @RequestParam String diseaseCode,
            @ApiParam("年份") @RequestParam Integer year) {

        List<Map<String, Object>> data = chronicDiseaseDataService.getTop10Prevalence(diseaseCode, year);
        return Result.success(data);
    }

    /**
     * 根据ID获取慢性病数据详情
     */
    @ApiOperation("根据ID获取慢性病数据详情")
    @GetMapping("/{id}")
    public Result<ChronicDiseaseData> getById(
            @ApiParam("数据ID") @PathVariable Long id) {

        ChronicDiseaseData data = chronicDiseaseDataService.getById(id);
        return Result.success(data);
    }
}