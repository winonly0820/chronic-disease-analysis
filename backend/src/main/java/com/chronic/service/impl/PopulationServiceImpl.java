package com.chronic.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.chronic.entity.Population;
import com.chronic.mapper.PopulationMapper;
import com.chronic.service.PopulationService;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

/**
 * 人群维度服务实现类
 *
 * @author chronic
 */
@Service
public class PopulationServiceImpl extends ServiceImpl<PopulationMapper, Population>
        implements PopulationService {

    @Override
    public List<String> getAgeGroupList() {
        LambdaQueryWrapper<Population> wrapper = new LambdaQueryWrapper<>();
        wrapper.select(Population::getAgeGroup)
                .groupBy(Population::getAgeGroup)
                .orderByAsc(Population::getAgeMin);
        return list(wrapper).stream()
                .map(Population::getAgeGroup)
                .distinct()
                .collect(Collectors.toList());
    }

    @Override
    public List<Population> getGenderList() {
        LambdaQueryWrapper<Population> wrapper = new LambdaQueryWrapper<>();
        wrapper.select(Population::getGender, Population::getGenderName)
                .groupBy(Population::getGender, Population::getGenderName)
                .orderByAsc(Population::getGender);
        return list(wrapper);
    }
}
