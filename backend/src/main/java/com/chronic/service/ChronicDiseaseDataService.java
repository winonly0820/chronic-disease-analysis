package com.chronic.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.chronic.entity.ChronicDiseaseData;

import java.util.List;
import java.util.Map;

/**
 * 慢性病数据服务接口
 *
 * @author chronic
 */
public interface ChronicDiseaseDataService extends IService<ChronicDiseaseData> {

    /**
     * 分页查询慢性病数据
     */
    Page<ChronicDiseaseData> getPage(Page<ChronicDiseaseData> page, ChronicDiseaseData query);

    /**
     * 获取各省份患病率统计
     */
    List<Map<String, Object>> getPrevalenceByProvince(String diseaseCode, Integer year);

    /**
     * 获取患病率趋势数据
     */
    List<Map<String, Object>> getPrevalenceTrend(Long regionId, String diseaseCode);

    /**
     * 获取各年龄段患病率分布
     */
    List<Map<String, Object>> getPrevalenceByAgeGroup(Long regionId, String diseaseCode, Integer year);

    /**
     * 获取各病种患病率对比
     */
    List<Map<String, Object>> getDiseaseComparison(Long regionId, Integer year);

    /**
     * 获取全国患病率Top10
     */
    List<Map<String, Object>> getTop10Prevalence(String diseaseCode, Integer year);
}
