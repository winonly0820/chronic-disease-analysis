package com.chronic.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.chronic.entity.Region;

import java.util.List;

/**
 * 地区信息服务接口
 *
 * @author chronic
 */
public interface RegionService extends IService<Region> {

    /**
     * 获取所有省份列表
     */
    List<Region> getProvinceList();

    /**
     * 根据父级编码获取下级地区列表
     */
    List<Region> getChildListByParentCode(String parentCode);

    /**
     * 获取地区树形结构
     */
    List<Region> getRegionTree();
}
