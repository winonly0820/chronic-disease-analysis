package com.chronic.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;

import java.io.Serializable;

/**
 * 时间维度实体类
 *
 * @author chronic
 */
@Data
@TableName("t_time")
public class TimeDimension implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键ID
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 年份（year是MySQL保留关键字，需要用反引号）
     */
    @TableField("`year`")
    private Integer year;

    /**
     * 季度
     */
    private Integer quarter;

    /**
     * 月份
     */
    private Integer month;

    /**
     * 年季度（year_quarter中的year是MySQL保留关键字）
     */
    @TableField("`year_quarter`")
    private String yearQuarter;

    /**
     * 年月（year_month中的year是MySQL保留关键字）
     */
    @TableField("`year_month`")
    private String yearMonth;
}
