package com.chronic.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.List;

/**
 * 地区信息实体类
 *
 * @author chronic
 */
@Data
@TableName("t_region")
public class Region implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键ID
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 地区编码
     */
    private String regionCode;

    /**
     * 地区名称
     */
    private String regionName;

    /**
     * 父级地区编码
     */
    private String parentCode;

    /**
     * 层级：1-省 2-市 3-县
     */
    private Integer regionLevel;

    /**
     * 创建时间
     */
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;

    /**
     * 更新时间
     */
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updateTime;

    /**
     * 状态：0-禁用 1-启用
     */
    private Integer status;

    /**
     * 下级地区列表（非数据库字段）
     */
    @TableField(exist = false)
    private List<Region> children;
}
