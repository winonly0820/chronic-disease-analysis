package com.chronic.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.chronic.entity.DiseaseType;

import java.util.List;

/**
 * 慢性病类型服务接口
 *
 * @author chronic
 */
public interface DiseaseTypeService extends IService<DiseaseType> {

    /**
     * 获取所有慢性病类型
     */
    List<DiseaseType> getAllDiseaseTypes();
}
