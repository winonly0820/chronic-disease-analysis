package com.chronic.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.chronic.entity.ChronicDiseaseData;
import com.chronic.entity.DiseaseType;
import com.chronic.entity.Region;
import com.chronic.entity.TimeDimension;
import com.chronic.mapper.ChronicDiseaseDataMapper;
import com.chronic.mapper.DiseaseTypeMapper;
import com.chronic.mapper.RegionMapper;
import com.chronic.mapper.TimeDimensionMapper;
import com.chronic.service.ChronicDiseaseDataService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 慢性病数据服务实现类
 *
 * @author chronic
 */
@Service
@RequiredArgsConstructor
public class ChronicDiseaseDataServiceImpl extends ServiceImpl<ChronicDiseaseDataMapper, ChronicDiseaseData>
        implements ChronicDiseaseDataService {

    private final DiseaseTypeMapper diseaseTypeMapper;
    private final RegionMapper regionMapper;
    private final TimeDimensionMapper timeDimensionMapper;

    /**
     * 根据疾病编码获取疾病ID
     */
    private Long getDiseaseIdByCode(String diseaseCode) {
        if (diseaseCode == null || diseaseCode.isEmpty()) {
            return null;
        }
        LambdaQueryWrapper<DiseaseType> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(DiseaseType::getDiseaseCode, diseaseCode);
        DiseaseType diseaseType = diseaseTypeMapper.selectOne(wrapper);
        return diseaseType != null ? diseaseType.getId() : null;
    }

    @Override
    public Page<ChronicDiseaseData> getPage(Page<ChronicDiseaseData> page, ChronicDiseaseData query) {
        LambdaQueryWrapper<ChronicDiseaseData> wrapper = new LambdaQueryWrapper<>();

        if (query != null) {
            if (query.getRegionId() != null) {
                wrapper.eq(ChronicDiseaseData::getRegionId, query.getRegionId());
            }
            if (query.getTimeId() != null) {
                wrapper.eq(ChronicDiseaseData::getTimeId, query.getTimeId());
            }
            if (query.getDiseaseId() != null) {
                wrapper.eq(ChronicDiseaseData::getDiseaseId, query.getDiseaseId());
            }
            if (query.getPopulationId() != null) {
                wrapper.eq(ChronicDiseaseData::getPopulationId, query.getPopulationId());
            }
        }

        wrapper.orderByDesc(ChronicDiseaseData::getCreateTime);
        return page(page, wrapper);
    }

    @Override
    public List<Map<String, Object>> getPrevalenceByProvince(String diseaseCode, Integer year) {
        // 1. 查询所有省份
        LambdaQueryWrapper<Region> regionWrapper = new LambdaQueryWrapper<>();
        regionWrapper.eq(Region::getRegionLevel, 1); // 省级
        List<Region> regions = regionMapper.selectList(regionWrapper);

        // 2. 查询时间维度ID
        Long timeId = null;
        if (year != null) {
            TimeDimension timeDimension = timeDimensionMapper.selectOne(
                new LambdaQueryWrapper<TimeDimension>()
                    .eq(TimeDimension::getYear, year)
            );
            if (timeDimension != null) {
                timeId = timeDimension.getId();
            }
        }

        // 3. 查询疾病数据
        LambdaQueryWrapper<ChronicDiseaseData> wrapper = new LambdaQueryWrapper<>();
        if (diseaseCode != null) {
            Long diseaseId = getDiseaseIdByCode(diseaseCode);
            if (diseaseId != null) {
                wrapper.eq(ChronicDiseaseData::getDiseaseId, diseaseId);
            }
        }
        if (timeId != null) {
            wrapper.eq(ChronicDiseaseData::getTimeId, timeId);
        }
        List<ChronicDiseaseData> dataList = list(wrapper);

        // 3. 构建返回结果
        List<Map<String, Object>> result = new ArrayList<>();
        for (Region region : regions) {
            Map<String, Object> item = new HashMap<>();
            item.put("regionName", region.getRegionName());
            item.put("regionCode", region.getRegionCode());

            // 查找该省份的数据
            final Long regionId = region.getId();
            dataList.stream()
                    .filter(d -> d.getRegionId().equals(regionId))
                    .findFirst()
                    .ifPresent(d -> {
                        item.put("prevalence", d.getPrevalenceRate());
                        item.put("incidence", d.getIncidenceRate());
                        item.put("mortality", d.getMortalityRate());
                    });

            // 如果没有数据，设置默认值
            if (!item.containsKey("prevalence")) {
                item.put("prevalence", 0);
                item.put("incidence", 0);
                item.put("mortality", 0);
            }

            result.add(item);
        }

        return result;
    }

    @Override
    public List<Map<String, Object>> getPrevalenceTrend(Long regionId, String diseaseCode) {
        LambdaQueryWrapper<ChronicDiseaseData> wrapper = new LambdaQueryWrapper<>();
        if (regionId != null) {
            wrapper.eq(ChronicDiseaseData::getRegionId, regionId);
        }
        if (diseaseCode != null) {
            Long diseaseId = getDiseaseIdByCode(diseaseCode);
            if (diseaseId != null) {
                wrapper.eq(ChronicDiseaseData::getDiseaseId, diseaseId);
            }
        }
        List<ChronicDiseaseData> list = list(wrapper);
        return list.stream().map(BeanUtil::beanToMap).collect(Collectors.toList());
    }

    @Override
    public List<Map<String, Object>> getPrevalenceByAgeGroup(Long regionId, String diseaseCode, Integer year) {
        LambdaQueryWrapper<ChronicDiseaseData> wrapper = new LambdaQueryWrapper<>();
        if (regionId != null) {
            wrapper.eq(ChronicDiseaseData::getRegionId, regionId);
        }
        if (diseaseCode != null) {
            Long diseaseId = getDiseaseIdByCode(diseaseCode);
            if (diseaseId != null) {
                wrapper.eq(ChronicDiseaseData::getDiseaseId, diseaseId);
            }
        }
        List<ChronicDiseaseData> list = list(wrapper);
        return list.stream().map(BeanUtil::beanToMap).collect(Collectors.toList());
    }

    @Override
    public List<Map<String, Object>> getDiseaseComparison(Long regionId, Integer year) {
        LambdaQueryWrapper<ChronicDiseaseData> wrapper = new LambdaQueryWrapper<>();
        if (regionId != null) {
            wrapper.eq(ChronicDiseaseData::getRegionId, regionId);
        }
        List<ChronicDiseaseData> list = list(wrapper);
        return list.stream().map(BeanUtil::beanToMap).collect(Collectors.toList());
    }

    @Override
    public List<Map<String, Object>> getTop10Prevalence(String diseaseCode, Integer year) {
        LambdaQueryWrapper<ChronicDiseaseData> wrapper = new LambdaQueryWrapper<>();
        if (diseaseCode != null) {
            Long diseaseId = getDiseaseIdByCode(diseaseCode);
            if (diseaseId != null) {
                wrapper.eq(ChronicDiseaseData::getDiseaseId, diseaseId);
            }
        }
        wrapper.last("LIMIT 10");
        List<ChronicDiseaseData> list = list(wrapper);
        return list.stream().map(BeanUtil::beanToMap).collect(Collectors.toList());
    }
}
