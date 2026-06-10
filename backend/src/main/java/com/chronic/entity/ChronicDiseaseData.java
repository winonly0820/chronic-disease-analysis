package com.chronic.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * 慢性病数据事实表实体类
 *
 * @author chronic
 */
@Data
@TableName("t_chronic_disease_data")
public class ChronicDiseaseData implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键ID
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 地区ID
     */
    private Long regionId;

    /**
     * 时间ID
     */
    private Long timeId;

    /**
     * 疾病ID
     */
    private Long diseaseId;

    /**
     * 人群ID
     */
    private Long populationId;

    /**
     * 患病率(%)
     */
    private BigDecimal prevalenceRate;

    /**
     * 发病率(%)
     */
    private BigDecimal incidenceRate;

    /**
     * 死亡率(%)
     */
    private BigDecimal mortalityRate;

    /**
     * 样本量
     */
    private Integer sampleSize;

    /**
     * 数据来源
     */
    private String dataSource;

    /**
     * 创建时间
     */
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;
}
