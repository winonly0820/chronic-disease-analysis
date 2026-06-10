package com.chronic.controller;

import com.chronic.common.Result;
import com.chronic.entity.DiseaseType;
import com.chronic.service.DiseaseTypeService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 慢性病类型控制器
 *
 * @author chronic
 */
@Api(tags = "慢性病类型管理")
@RestController
@RequestMapping("/api/disease-type")
@RequiredArgsConstructor
public class DiseaseTypeController {

    private final DiseaseTypeService diseaseTypeService;

    @ApiOperation("获取所有慢性病类型")
    @GetMapping("/list")
    public Result<List<DiseaseType>> list() {
        List<DiseaseType> types = diseaseTypeService.getAllDiseaseTypes();
        return Result.success(types);
    }

    @ApiOperation("根据ID获取慢性病类型详情")
    @GetMapping("/{id}")
    public Result<DiseaseType> getById(@PathVariable Long id) {
        DiseaseType type = diseaseTypeService.getById(id);
        return Result.success(type);
    }

    @ApiOperation("根据编码获取慢性病类型")
    @GetMapping("/code/{code}")
    public Result<DiseaseType> getByCode(@PathVariable String code) {
        List<DiseaseType> types = diseaseTypeService.getAllDiseaseTypes();
        DiseaseType type = types.stream()
                .filter(t -> t.getDiseaseCode().equals(code))
                .findFirst()
                .orElse(null);
        return Result.success(type);
    }
}
