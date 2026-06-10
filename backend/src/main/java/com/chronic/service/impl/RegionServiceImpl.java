package com.chronic.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.chronic.entity.Region;
import com.chronic.mapper.RegionMapper;
import com.chronic.service.RegionService;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

/**
 * 地区信息服务实现类
 *
 * @author chronic
 */
@Service
public class RegionServiceImpl extends ServiceImpl<RegionMapper, Region> implements RegionService {

    @Override
    public List<Region> getProvinceList() {
        LambdaQueryWrapper<Region> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Region::getRegionLevel, 1)
                .eq(Region::getStatus, 1)
                .orderByAsc(Region::getRegionCode);
        return list(wrapper);
    }

    @Override
    public List<Region> getChildListByParentCode(String parentCode) {
        LambdaQueryWrapper<Region> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Region::getParentCode, parentCode)
                .eq(Region::getStatus, 1)
                .orderByAsc(Region::getRegionCode);
        return list(wrapper);
    }

    @Override
    public List<Region> getRegionTree() {
        // 获取所有省份
        List<Region> provinces = getProvinceList();

        // 为每个省份获取下级地区
        for (Region province : provinces) {
            List<Region> children = getChildListByParentCode(province.getRegionCode());
            province.setChildren(children);
        }

        return provinces;
    }
}
