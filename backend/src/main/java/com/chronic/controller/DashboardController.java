package com.chronic.controller;

import com.chronic.common.Result;
import com.chronic.entity.DiseaseType;
import com.chronic.service.ChronicDiseaseDataService;
import com.chronic.service.DiseaseTypeService;
import com.chronic.service.RegionService;
import com.chronic.service.TimeDimensionService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 仪表盘控制器 - 提供首页统计数据
 *
 * @author chronic
 */
@Api(tags = "仪表盘")
@RestController
@RequestMapping("/api/dashboard")
@RequiredArgsConstructor
public class DashboardController {

    private final RegionService regionService;
    private final DiseaseTypeService diseaseTypeService;
    private final TimeDimensionService timeDimensionService;
    private final ChronicDiseaseDataService chronicDiseaseDataService;

    @ApiOperation("获取首页统计数据")
    @GetMapping("/statistics")
    public Result<Map<String, Object>> getStatistics() {
        Map<String, Object> statistics = new HashMap<>();

        // 省份数量
        statistics.put("provinceCount", regionService.getProvinceList().size());

        // 病种数量
        List<DiseaseType> diseaseTypes = diseaseTypeService.getAllDiseaseTypes();
        statistics.put("diseaseCount", diseaseTypes.size());

        // 年份范围
        List<Integer> years = timeDimensionService.getYearList();
        if (!years.isEmpty()) {
            statistics.put("yearRange", years.get(years.size() - 1) + "-" + years.get(0));
        }

        // 数据记录数 - 查询t_chronic_disease_data表的总记录数
        long dataCount = chronicDiseaseDataService.count();
        statistics.put("dataCount", dataCount);

        return Result.success(statistics);
    }

    @ApiOperation("获取所有病种列表（用于图表筛选）")
    @GetMapping("/disease-types")
    public Result<List<DiseaseType>> getDiseaseTypes() {
        return Result.success(diseaseTypeService.getAllDiseaseTypes());
    }
}
