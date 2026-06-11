package com.chronic.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
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
     * 分页查询慢性病数据，并关联省份、病种、年份名称
     */
    @Select({
            "<script>",
            "SELECT",
            "    d.id AS id,",
            "    d.region_id AS regionId,",
            "    d.time_id AS timeId,",
            "    d.disease_id AS diseaseId,",
            "    d.population_id AS populationId,",
            "    d.prevalence_rate AS prevalenceRate,",
            "    d.incidence_rate AS incidenceRate,",
            "    d.mortality_rate AS mortalityRate,",
            "    d.sample_size AS sampleSize,",
            "    d.data_source AS dataSource,",
            "    d.create_time AS createTime,",
            "    r.region_name AS regionName,",
            "    dt.disease_name AS diseaseName,",
            "    t.year AS year",
            "FROM t_chronic_disease_data d",
            "LEFT JOIN t_region r ON d.region_id = r.id",
            "LEFT JOIN t_disease_type dt ON d.disease_id = dt.id",
            "LEFT JOIN t_time t ON d.time_id = t.id",
            "WHERE 1 = 1",
            "<if test='query != null and query.regionId != null'>",
            "    AND d.region_id = #{query.regionId}",
            "</if>",
            "<if test='query != null and query.year != null'>",
            "    AND t.year = #{query.year}",
            "</if>",
            "<if test='query != null and query.diseaseId != null'>",
            "    AND d.disease_id = #{query.diseaseId}",
            "</if>",
            "<if test='query != null and query.populationId != null'>",
            "    AND d.population_id = #{query.populationId}",
            "</if>",
            "ORDER BY d.create_time DESC",
            "</script>"
    })
    Page<ChronicDiseaseData> selectPageWithName(
            Page<ChronicDiseaseData> page,
            @Param("query") ChronicDiseaseData query
    );

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

    /**
     * 各病种患病率、发病率、死亡率对比
     */
    @Select({
            "SELECT",
            "    dt.id AS diseaseId,",
            "    dt.disease_code AS diseaseCode,",
            "    dt.disease_name AS diseaseName,",
            "    ROUND(AVG(d.prevalence_rate), 2) AS prevalenceRate,",
            "    ROUND(AVG(d.incidence_rate), 2) AS incidenceRate,",
            "    ROUND(AVG(d.mortality_rate), 2) AS mortalityRate",
            "FROM t_chronic_disease_data d",
            "JOIN t_disease_type dt ON d.disease_id = dt.id",
            "JOIN t_time t ON d.time_id = t.id",
            "WHERE d.region_id = #{regionId}",
            "  AND t.year = #{year}",
            "  AND d.prevalence_rate IS NOT NULL",
            "GROUP BY dt.id, dt.disease_code, dt.disease_name",
            "ORDER BY dt.id ASC"
    })
    List<Map<String, Object>> selectDiseaseComparison(
            @Param("regionId") Long regionId,
            @Param("year") Integer year
    );

    /**
     * 获取全国患病率Top10省份
     */
    @Select({
            "SELECT",
            "    r.id AS regionId,",
            "    r.region_code AS regionCode,",
            "    r.region_name AS regionName,",
            "    ROUND(AVG(d.prevalence_rate), 2) AS prevalenceRate",
            "FROM t_chronic_disease_data d",
            "JOIN t_region r ON d.region_id = r.id",
            "JOIN t_disease_type dt ON d.disease_id = dt.id",
            "JOIN t_time t ON d.time_id = t.id",
            "WHERE dt.disease_code = #{diseaseCode}",
            "  AND t.year = #{year}",
            "  AND r.region_level = 1",
            "  AND d.prevalence_rate IS NOT NULL",
            "GROUP BY r.id, r.region_code, r.region_name",
            "ORDER BY prevalenceRate DESC",
            "LIMIT 10"
    })
    List<Map<String, Object>> selectTop10Prevalence(
            @Param("diseaseCode") String diseaseCode,
            @Param("year") Integer year
    );
}