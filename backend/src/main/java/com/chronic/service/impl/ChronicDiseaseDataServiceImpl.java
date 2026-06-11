package com.chronic.service.impl;

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

/**
 * 慢性病数据服务实现类
 *
 * @author chronic
 */
@Service
@RequiredArgsConstructor
public class ChronicDiseaseDataServiceImpl
        extends ServiceImpl<ChronicDiseaseDataMapper, ChronicDiseaseData>
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

    /**
     * 分页查询慢性病数据
     *
     * 注意：
     * 这里不再使用 MyBatis-Plus 默认的 page(page, wrapper)，
     * 因为默认分页只能查 t_chronic_disease_data 单表，
     * 无法返回 regionName、diseaseName、year。
     */
    @Override
    public Page<ChronicDiseaseData> getPage(Page<ChronicDiseaseData> page, ChronicDiseaseData query) {
        return baseMapper.selectPageWithName(page, query);
    }

    @Override
    public List<Map<String, Object>> getPrevalenceByProvince(String diseaseCode, Integer year) {
        // 1. 查询所有省级地区
        LambdaQueryWrapper<Region> regionWrapper = new LambdaQueryWrapper<>();
        regionWrapper.eq(Region::getRegionLevel, 1);

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

        // 3. 查询疾病ID
        Long diseaseId = null;
        if (diseaseCode != null && !diseaseCode.isEmpty()) {
            diseaseId = getDiseaseIdByCode(diseaseCode);
        }

        // 4. 查询疾病数据
        LambdaQueryWrapper<ChronicDiseaseData> wrapper = new LambdaQueryWrapper<>();

        if (diseaseId != null) {
            wrapper.eq(ChronicDiseaseData::getDiseaseId, diseaseId);
        }

        if (timeId != null) {
            wrapper.eq(ChronicDiseaseData::getTimeId, timeId);
        }

        List<ChronicDiseaseData> dataList = list(wrapper);

        // 5. 构建返回结果
        List<Map<String, Object>> result = new ArrayList<>();

        for (Region region : regions) {
            Map<String, Object> item = new HashMap<>();

            item.put("regionName", region.getRegionName());
            item.put("regionCode", region.getRegionCode());

            final Long regionId = region.getId();

            dataList.stream()
                    .filter(d -> d.getRegionId().equals(regionId))
                    .findFirst()
                    .ifPresent(d -> {
                        item.put("prevalence", d.getPrevalenceRate());
                        item.put("incidence", d.getIncidenceRate());
                        item.put("mortality", d.getMortalityRate());
                    });

            if (!item.containsKey("prevalence")) {
                item.put("prevalence", 0);
                item.put("incidence", 0);
                item.put("mortality", 0);
            }

            result.add(item);
        }

        return result;
    }

    /**
     * 获取患病率趋势数据
     */
    @Override
    public List<Map<String, Object>> getPrevalenceTrend(Long regionId, String diseaseCode) {
        return baseMapper.selectPrevalenceTrend(regionId, diseaseCode);
    }

    /**
     * 获取各年龄段患病率分布
     */
    @Override
    public List<Map<String, Object>> getPrevalenceByAgeGroup(Long regionId, String diseaseCode, Integer year) {
        return baseMapper.selectPrevalenceByAgeGroup(regionId, diseaseCode, year);
    }

    /**
     * 获取各病种患病率、发病率、死亡率对比
     */
    @Override
    public List<Map<String, Object>> getDiseaseComparison(Long regionId, Integer year) {
        return baseMapper.selectDiseaseComparison(regionId, year);
    }

    /**
     * 获取全国患病率Top10省份
     */
    @Override
    public List<Map<String, Object>> getTop10Prevalence(String diseaseCode, Integer year) {
        return baseMapper.selectTop10Prevalence(diseaseCode, year);
    }
}