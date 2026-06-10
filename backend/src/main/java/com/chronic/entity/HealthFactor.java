package com.chronic.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * 健康影响因素实体类
 *
 * @author chronic
 */
@Data
@TableName("t_health_factor")
public class HealthFactor implements Serializable {

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
     * 吸烟率(%)
     */
    private BigDecimal smokingRate;

    /**
     * 饮酒率(%)
     */
    private BigDecimal drinkingRate;

    /**
     * 肥胖率(%)
     */
    private BigDecimal obesityRate;

    /**
     * 经常锻炼率(%)
     */
    private BigDecimal exerciseRate;

    /**
     * 高血压知晓率(%)
     */
    private BigDecimal hypertensionRate;

    /**
     * 糖尿病知晓率(%)
     */
    private BigDecimal diabetesRate;
}
