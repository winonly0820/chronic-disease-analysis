package com.chronic;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.chronic.entity.ChronicDiseaseData;
import com.chronic.entity.DiseaseType;
import com.chronic.mapper.ChronicDiseaseDataMapper;
import com.chronic.mapper.DiseaseTypeMapper;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

/**
 * 数据库连接和查询测试类
 * 用于诊断500错误问题
 *
 * @author chronic
 */
@SpringBootTest
public class DatabaseConnectionTest {

    @Autowired
    private ChronicDiseaseDataMapper chronicDiseaseDataMapper;

    @Autowired
    private DiseaseTypeMapper diseaseTypeMapper;

    /**
     * 测试1：验证数据库连接是否正常
     */
    @Test
    public void testDatabaseConnection() {
        System.out.println("=== 测试数据库连接 ===");
        try {
            List<ChronicDiseaseData> list = chronicDiseaseDataMapper.selectList(null);
            System.out.println("✅ 数据库连接成功！");
            System.out.println("✅ 慢性病数据表记录数: " + list.size());
            if (!list.isEmpty()) {
                System.out.println("✅ 第一条数据: " + list.get(0));
            }
        } catch (Exception e) {
            System.out.println("❌ 数据库连接失败！");
            System.out.println("错误信息: " + e.getMessage());
            e.printStackTrace();
        }
    }

    /**
     * 测试2：查询疾病类型表
     */
    @Test
    public void testDiseaseTypeQuery() {
        System.out.println("=== 测试疾病类型查询 ===");
        try {
            List<DiseaseType> list = diseaseTypeMapper.selectList(null);
            System.out.println("✅ 疾病类型查询成功！");
            System.out.println("✅ 疾病类型数量: " + list.size());
            for (DiseaseType dt : list) {
                System.out.println("  - " + dt.getDiseaseCode() + ": " + dt.getDiseaseName() + " (ID=" + dt.getId() + ")");
            }
        } catch (Exception e) {
            System.out.println("❌ 疾病类型查询失败！");
            System.out.println("错误信息: " + e.getMessage());
            e.printStackTrace();
        }
    }

    /**
     * 测试3：通过疾病编码查询慢性病数据（模拟Service层逻辑）
     * 这个测试会暴露类型不匹配的问题
     */
    @Test
    public void testQueryByDiseaseCode() {
        System.out.println("=== 测试通过疾病编码查询（模拟Service层逻辑） ===");
        String diseaseCode = "HYP";  // 高血压编码

        try {
            // 先查询疾病ID
            LambdaQueryWrapper<DiseaseType> diseaseWrapper = new LambdaQueryWrapper<>();
            diseaseWrapper.eq(DiseaseType::getDiseaseCode, diseaseCode);
            DiseaseType diseaseType = diseaseTypeMapper.selectOne(diseaseWrapper);

            if (diseaseType == null) {
                System.out.println("❌ 未找到疾病编码: " + diseaseCode);
                return;
            }

            System.out.println("✅ 找到疾病: " + diseaseType.getDiseaseName() + " (ID=" + diseaseType.getId() + ")");

            // 使用疾病ID查询慢性病数据
            LambdaQueryWrapper<ChronicDiseaseData> dataWrapper = new LambdaQueryWrapper<>();
            dataWrapper.eq(ChronicDiseaseData::getDiseaseId, diseaseType.getId());
            List<ChronicDiseaseData> dataList = chronicDiseaseDataMapper.selectList(dataWrapper);

            System.out.println("✅ 查询到慢性病数据: " + dataList.size() + " 条");
            if (!dataList.isEmpty()) {
                System.out.println("✅ 第一条数据样本量: " + dataList.get(0).getSampleSize());
            }

        } catch (Exception e) {
            System.out.println("❌ 查询失败！");
            System.out.println("错误信息: " + e.getMessage());
            e.printStackTrace();
        }
    }

    /**
     * 测试4：直接使用字符串查询Long字段（模拟错误用法）
     */
    @Test
    public void testQueryWithWrongType() {
        System.out.println("=== 测试类型不匹配的查询（模拟错误用法） ===");
        String diseaseCode = "HYP";

        try {
            // 错误：直接用String类型的diseaseCode查询Long类型的diseaseId
            LambdaQueryWrapper<ChronicDiseaseData> wrapper = new LambdaQueryWrapper<>();
            wrapper.eq(ChronicDiseaseData::getDiseaseId, diseaseCode);  // 类型不匹配！

            List<ChronicDiseaseData> list = chronicDiseaseDataMapper.selectList(wrapper);
            System.out.println("查询结果: " + list.size() + " 条");
        } catch (Exception e) {
            System.out.println("❌ 类型不匹配导致查询失败！");
            System.out.println("错误信息: " + e.getMessage());
            System.out.println("错误类型: " + e.getClass().getSimpleName());
        }
    }

    /**
     * 测试5：分页查询测试
     */
    @Test
    public void testPaginationQuery() {
        System.out.println("=== 测试分页查询 ===");
        try {
            LambdaQueryWrapper<ChronicDiseaseData> wrapper = new LambdaQueryWrapper<>();
            wrapper.orderByDesc(ChronicDiseaseData::getCreateTime);

            // 使用MyBatis-Plus分页
            com.baomidou.mybatisplus.extension.plugins.pagination.Page<ChronicDiseaseData> page =
                    new com.baomidou.mybatisplus.extension.plugins.pagination.Page<>(1, 10);

            com.baomidou.mybatisplus.extension.plugins.pagination.Page<ChronicDiseaseData> result =
                    chronicDiseaseDataMapper.selectPage(page, wrapper);

            System.out.println("✅ 分页查询成功！");
            System.out.println("✅ 总记录数: " + result.getTotal());
            System.out.println("✅ 当前页数据: " + result.getRecords().size() + " 条");
            System.out.println("✅ 当前页: " + result.getCurrent() + ", 每页大小: " + result.getSize());

        } catch (Exception e) {
            System.out.println("❌ 分页查询失败！");
            System.out.println("错误信息: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
