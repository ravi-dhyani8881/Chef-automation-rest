package com.spring.rest.custom;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Documented
@Constraint(validatedBy = ForeignKeyValidator.class) // Link to your validator class
@Target({ ElementType.FIELD, ElementType.PARAMETER }) // Can be applied to fields and method parameters
@Retention(RetentionPolicy.RUNTIME) // Available at runtime for validation
public @interface ForeignKey {

    String message() default "Foreign key constraint violation: referenced entity not found.";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};

    // Custom attributes for your foreign key logic
    Class<?> entity(); // The JPA entity class representing the parent table (e.g., Organization.class)
    String fieldName() default "id"; // The field in the parent entity to check against (defaults to "id")
    String collectionName() default "";
}