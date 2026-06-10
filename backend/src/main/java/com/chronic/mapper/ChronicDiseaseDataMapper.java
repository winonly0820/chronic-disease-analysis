package com.chronic.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.chronic.entity.ChronicDiseaseData;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

/**
 * 慢性病数据Mapper接口
 *
 * @author chronic
 */
@Mapper
public interface ChronicDiseaseDataMapper extends BaseMapper<ChronicDiseaseData> {

    /**
     * 查询某省份某病种的患病率年度趋势
     */
    @Select({
            "SELECT",
            "    t.year AS year,",
            "    ROUND(AVG(d.prevalence_rate), 4) AS prevalence",
            "FROM t_chronic_disease_data d",
            "JOIN t_time t ON d.time_id = t.id",
            "JOIN t_disease_type dt ON d.disease_id = dt.id",
            "WHERE d.region_id = #{regionId}",
            "  AND dt.disease_code = #{diseaseCode}",
            "  AND d.prevalence_rate IS NOT NULL",
            "GROUP BY t.year",
            "ORDER BY t.year ASC"
    })
    List<Map<String, Object>> selectPrevalenceTrend(
            @Param("regionId") Long regionId,
            @Param("diseaseCode") String diseaseCode
    );

    /**
     * 查询某省份某病种某年份的年龄段患病率分布
     */
    @Select({
            "SELECT",
            "    p.age_group AS ageGroup,",
            "    ROUND(AVG(d.prevalence_rate), 4) AS prevalence",
            "FROM t_chronic_disease_data d",
            "JOIN t_population p ON d.population_id = p.id",
            "JOIN t_disease_type dt ON d.disease_id = dt.id",
            "JOIN t_time t ON d.time_id = t.id",
            "WHERE d.region_id = #{regionId}",
            "  AND dt.disease_code = #{diseaseCode}",
            "  AND t.year = #{year}",
            "  AND p.gender = 0",
            "  AND d.prevalence_rate IS NOT NULL",
            "GROUP BY p.age_group, p.age_min",
            "ORDER BY p.age_min ASC"
    })
    List<Map<String, Object>> selectPrevalenceByAgeGroup(
            @Param("regionId") Long regionId,
            @Param("diseaseCode") String diseaseCode,
            @Param("year") Integer year
    );
}