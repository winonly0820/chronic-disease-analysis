package com.chronic.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.chronic.entity.TimeDimension;

import java.util.List;

/**
 * 时间维度服务接口
 *
 * @author chronic
 */
public interface TimeDimensionService extends IService<TimeDimension> {

    /**
     * 获取所有年份列表
     */
    List<Integer> getYearList();

    /**
     * 根据年份获取季度列表
     */
    List<TimeDimension> getQuarterListByYear(Integer year);
}
