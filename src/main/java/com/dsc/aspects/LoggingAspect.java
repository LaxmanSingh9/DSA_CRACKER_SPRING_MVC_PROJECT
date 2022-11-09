package com.dsc.aspects;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import java.util.logging.Logger;

import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.hibernate.mapping.Join;
import org.springframework.stereotype.Component;

/**
 * Created by CryptoSingh1337 on 6/7/2021
 */
@Aspect
@Component
public class LoggingAspect {

    private final Logger logger = Logger.getLogger(getClass().getName());

    @Pointcut("execution(* com.dsc.controller.*.*(..))")
    private void forControllerPackage() {}

    @Pointcut("execution(* com.dsc.service.*.*(..))")
    private void forServicePackage() {}

    @Pointcut("execution(* com.dsc.dao.*.*(..))")
    private void forDAOPackage() {}
    
    @Pointcut("execution(* com.dsc.handler.*.*(..))")
    private void forHandlerPackage() {}
    
    @Pointcut("forControllerPackage() || forServicePackage() || forDAOPackage() || forHandlerPackage()")
    private void forAppFlow() {}

    @Before("forAppFlow()")
    public void before(JoinPoint joinPoint) {
        logger.info("=======>> in @Before: calling method: " + joinPoint.getSignature().toShortString());
        Object[] args = joinPoint.getArgs();
        for (Object arg : args)
            logger.info("=======>> argument: " + arg);
    }

    @AfterReturning(
            pointcut = "forAppFlow()",
            returning = "result"
    )
    public void afterReturning(JoinPoint joinPoint, Object result) {
        logger.info("=======>> in @Before: calling method: " + joinPoint.getSignature().toShortString());
        logger.info("=======>> result: " + result);
    }
}
