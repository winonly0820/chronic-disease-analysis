package com.chronic.common;

import lombok.Getter;

/**
 * 业务异常类
 *
 * @author chronic
 */
@Getter
public class BusinessException extends RuntimeException {

    /**
     * 状态码
     */
    private final Integer code;

    public BusinessException(String message) {
        super(message);
        this.code = 500;
    }

    public BusinessException(Integer code, String message) {
        super(message);
        this.code = code;
    }

    public static BusinessException of(String message) {
        return new BusinessException(message);
    }

    public static BusinessException of(Integer code, String message) {
        return new BusinessException(code, message);
    }
}
