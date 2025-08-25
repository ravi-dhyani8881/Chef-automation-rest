// src/main/java/com/spring/rest/exception/GlobalExceptionHandler.java
package com.spring.rest.exception;

import com.spring.rest.util.ResponseMessage;
import com.spring.rest.util.FieldErrorDetail; // Import the new class
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import java.util.List;
import java.util.stream.Collectors;

@ControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ResponseEntity<ResponseMessage> handleValidationExceptions(
            MethodArgumentNotValidException ex) {

        // Collect all field errors into a list of FieldErrorDetail objects
        List<FieldErrorDetail> fieldErrors = ex.getBindingResult().getAllErrors().stream()
                .filter(error -> error instanceof FieldError) // Only process field-specific errors
                .map(error -> {
                    FieldError fieldError = (FieldError) error;
                    return new FieldErrorDetail(
                            fieldError.getField(),
                            fieldError.getRejectedValue(),
                            fieldError.getDefaultMessage(),
                            fieldError.getCode() // You can also use fieldError.getCodes()[0] for the primary code
                    );
                })
                .collect(Collectors.toList());

        // Build your custom ResponseMessage
        // You can have a general message like "Validation failed"
        // and then provide the detailed fieldErrors list.
        ResponseMessage response = new ResponseMessage.Builder("Validation failed for one or more fields.", HttpStatus.BAD_REQUEST.value())
                .withResponseType("error")
                .withFieldErrors(fieldErrors) // Set the list of detailed errors
                .build();

        return new ResponseEntity<>(response, HttpStatus.BAD_REQUEST);
    }

    // Keep your generic exception handler if needed
    @ExceptionHandler(Exception.class)
    public ResponseEntity<ResponseMessage> handleGenericException(Exception ex) {
        System.err.println("An unexpected error occurred: " + ex.getMessage());
        ex.printStackTrace();

        ResponseMessage response = new ResponseMessage.Builder("Internal Server Error. Please try again later.", HttpStatus.INTERNAL_SERVER_ERROR.value())
                .withResponseType("error")
                .build();

        return new ResponseEntity<>(response, HttpStatus.INTERNAL_SERVER_ERROR);
    }
}