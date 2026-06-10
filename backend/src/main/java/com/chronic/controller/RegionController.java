package com.chronic.controller;

import com.chronic.common.Result;
import com.chronic.entity.Region;
import com.chronic.service.RegionService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 地区信息控制器
 *
 * @author chronic
 */
@Api(tags = "地区信息管理")
@RestController
@RequestMapping("/api/region")
@RequiredArgsConstructor
public class RegionController {

    private final RegionService regionService;

    @ApiOperation("获取所有省份列表")
    @GetMapping("/provinces")
    public Result<List<Region>> getProvinces() {
        List<Region> provinces = regionService.getProvinceList();
        return Result.success(provinces);
    }

    @ApiOperation("根据父级编码获取下级地区列表")
    @GetMapping("/children/{parentCode}")
    public Result<List<Region>> getChildren(@PathVariable String parentCode) {
        List<Region> children = regionService.getChildListByParentCode(parentCode);
        return Result.success(children);
    }

    @ApiOperation("获取地区树形结构")
    @GetMapping("/tree")
    public Result<List<Region>> getTree() {
        List<Region> tree = regionService.getRegionTree();
        return Result.success(tree);
    }

    @ApiOperation("根据ID获取地区详情")
    @GetMapping("/{id}")
    public Result<Region> getById(@PathVariable Long id) {
        Region region = regionService.getById(id);
        return Result.success(region);
    }
}
