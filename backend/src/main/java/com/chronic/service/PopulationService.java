package com.chronic.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.chronic.entity.Population;

import java.util.List;

/**
 * 人群维度服务接口
 *
 * @author chronic
 */
public interface PopulationService extends IService<Population> {

    /**
     * 获取所有年龄段列表
     */
    List<String> getAgeGroupList();

    /**
     * 获取所有性别列表
     */
    List<Population> getGenderList();
}
