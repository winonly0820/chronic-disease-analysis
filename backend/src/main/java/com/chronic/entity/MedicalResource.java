package com.chronic.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * 医疗资源实体类
 *
 * @author chronic
 */
@Data
@TableName("t_medical_resource")
public class MedicalResource implements Serializable {

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
     * 医疗机构数量
     */
    private Integer hospitalCount;

    /**
     * 床位数
     */
    private Integer bedCount;

    /**
     * 执业医师数
     */
    private Integer doctorCount;

    /**
     * 注册护士数
     */
    private Integer nurseCount;

    /**
     * 卫生总费用(亿元)
     */
    private BigDecimal healthExpenditure;
}
