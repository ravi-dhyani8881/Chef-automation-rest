package com.spring.rest.custom;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

@Component
public class ForeignKeysValidator implements ConstraintValidator<ForeignKeys, Object> {

 @Autowired
 private ApplicationContext applicationContext;

 @Override
 public void initialize(ForeignKeys constraintAnnotation) {
    System.out.println("------ForeignKeysValidator----initialize---->");
 }

 @Override
 public boolean isValid(Object value, ConstraintValidatorContext context) {
	 
 	 System.out.println("------ForeignKeysValidator----isValid---->");
 	 
 	 
     if (value == null) {
         return true; // Handle nulls as before
     }

     // Get the array of individual @ForeignKey annotations
     ForeignKey[] foreignKeys = context.unwrap(ForeignKeys.class).value();

     // If no specific message is set for the container, disable default message
     // to allow custom messages from individual validations
     context.disableDefaultConstraintViolation();

     // Logic: The value is valid if it exists in AT LEAST ONE of the specified entities
     for (ForeignKey fk : foreignKeys) {
         try {
             String repositoryBeanName = Character.toLowerCase(fk.entity().getSimpleName().charAt(0)) +
                                         fk.entity().getSimpleName().substring(1) + "Repository";
            
         
         } catch (Exception e) {
             System.err.println("Error during multi-FK validation for value: " + value + " against " + fk.entity().getSimpleName() + ": " + e.getMessage());
             // Don't return false immediately on error for one, try others, but log.
         }
     }

     // If we reached here, the value was not found in any of the specified entities
     // Add a custom error message for the overall failure
     context.buildConstraintViolationWithTemplate("Value '" + value + "' does not exist in any of the referenced entities.")
            .addConstraintViolation();
     return false;
 }
}