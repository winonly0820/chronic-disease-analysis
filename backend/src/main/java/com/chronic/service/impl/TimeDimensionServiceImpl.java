package com.chronic.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.chronic.entity.TimeDimension;
import com.chronic.mapper.TimeDimensionMapper;
import com.chronic.service.TimeDimensionService;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

/**
 * 时间维度服务实现类
 *
 * @author chronic
 */
@Service
public class TimeDimensionServiceImpl extends ServiceImpl<TimeDimensionMapper, TimeDimension>
        implements TimeDimensionService {

    @Override
    public List<Integer> getYearList() {
        LambdaQueryWrapper<TimeDimension> wrapper = new LambdaQueryWrapper<>();
        wrapper.select(TimeDimension::getYear)
                .groupBy(TimeDimension::getYear)
                .orderByDesc(TimeDimension::getYear);
        return list(wrapper).stream()
                .map(TimeDimension::getYear)
                .distinct()
                .collect(Collectors.toList());
    }

    @Override
    public List<TimeDimension> getQuarterListByYear(Integer year) {
        LambdaQueryWrapper<TimeDimension> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(TimeDimension::getYear, year)
                .isNotNull(TimeDimension::getQuarter)
                .orderByAsc(TimeDimension::getQuarter);
        return list(wrapper);
    }
}
