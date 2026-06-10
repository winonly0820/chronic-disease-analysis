package com.chronic.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;

import java.io.Serializable;

/**
 * 慢性病类型实体类
 *
 * @author chronic
 */
@Data
@TableName("t_disease_type")
public class DiseaseType implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键ID
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 疾病编码
     */
    private String diseaseCode;

    /**
     * 疾病名称
     */
    private String diseaseName;

    /**
     * 疾病分类
     */
    private String diseaseCategory;

    /**
     * 疾病描述
     */
    private String description;
}
