package com.yellowcong.utils;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;


/**
 * 通过注解来操作别名,判断的是字段上的别名
 * 通过这个注解类和我们的PoiUtils 可以很好的解决文档导出的问题
 * 
 * @author yellowcong
 * @date 2016年1月7日
 */
@Target({ java.lang.annotation.ElementType.FIELD })
@Retention(RetentionPolicy.RUNTIME)
public @interface HFFSAlias{
	//设定别名,通过value 这个函数，就不需要写参数了
	//@HFFSAlias("xx") 就可以了
	public String value() default "";
}