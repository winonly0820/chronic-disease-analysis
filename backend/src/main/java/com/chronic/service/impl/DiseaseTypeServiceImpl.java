package com.chronic.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.chronic.entity.DiseaseType;
import com.chronic.mapper.DiseaseTypeMapper;
import com.chronic.service.DiseaseTypeService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 慢性病类型服务实现类
 *
 * @author chronic
 */
@Service
public class DiseaseTypeServiceImpl extends ServiceImpl<DiseaseTypeMapper, DiseaseType>
        implements DiseaseTypeService {

    @Override
    public List<DiseaseType> getAllDiseaseTypes() {
        LambdaQueryWrapper<DiseaseType> wrapper = new LambdaQueryWrapper<>();
        wrapper.orderByAsc(DiseaseType::getDiseaseCode);
        return list(wrapper);
    }
}
