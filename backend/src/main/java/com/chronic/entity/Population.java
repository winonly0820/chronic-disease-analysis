package com.chronic.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;

import java.io.Serializable;

/**
 * 人群维度实体类
 *
 * @author chronic
 */
@Data
@TableName("t_population")
public class Population implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键ID
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 年龄段
     */
    private String ageGroup;

    /**
     * 最小年龄
     */
    private Integer ageMin;

    /**
     * 最大年龄
     */
    private Integer ageMax;

    /**
     * 性别：0-不限 1-男 2-女
     */
    private Integer gender;

    /**
     * 性别名称
     */
    private String genderName;
}
