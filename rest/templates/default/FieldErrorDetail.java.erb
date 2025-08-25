package com.spring.rest.util;

//Option A: Inside ResponseMessage.java or a new file like FieldErrorDetail.java


import com.fasterxml.jackson.annotation.JsonInclude;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class FieldErrorDetail {
 private String field;
 private Object rejectedValue;
 private String message;
 private String code; // Optional: Add if you want to expose validation codes

 public FieldErrorDetail(String field, Object rejectedValue, String message, String code) {
     this.field = field;
     this.rejectedValue = rejectedValue;
     this.message = message;
     this.code = code;
 }

 // Getters
 public String getField() { return field; }
 public Object getRejectedValue() { return rejectedValue; }
 public String getMessage() { return message; }
 public String getCode() { return code; }

 // No setters needed if immutable
}

//If you put it inside ResponseMessage, it would look like this:
/*
package com.spring.rest.util;

//... other imports ...

@JsonInclude(JsonInclude.Include.NON_NULL)
public class ResponseMessage {
 // ... existing fields and builder ...

 // New field to hold a list of error details
 private List<FieldErrorDetail> fieldErrors; // Add this to your ResponseMessage

 // Modify private constructor to include fieldErrors
 private ResponseMessage(Builder builder) {
     // ... existing assignments ...
     this.fieldErrors = builder.fieldErrors;
 }

 // New getter
 public List<FieldErrorDetail> getFieldErrors() { return fieldErrors; }

 public static class Builder {
     // ... existing fields ...
     private List<FieldErrorDetail> fieldErrors; // Add this to your Builder

     public Builder(String responseMessage, int responseCode) {
         this.responseMessage = responseMessage;
         this.responseCode = responseCode;
     }

     // New builder method
     public Builder withFieldErrors(List<FieldErrorDetail> fieldErrors) {
         this.fieldErrors = fieldErrors;
         return this;
     }
     // ... existing builder methods ...
 }

 // ... existing getters ...

 // And the FieldErrorDetail class as a static nested class
 @JsonInclude(JsonInclude.Include.NON_NULL)
 public static class FieldErrorDetail {
     private String field;
     private Object rejectedValue;
     private String message;
     private String code;

     public FieldErrorDetail(String field, Object rejectedValue, String message, String code) {
         this.field = field;
         this.rejectedValue = rejectedValue;
         this.message = message;
         this.code = code;
     }

     public String getField() { return field; }
     public Object getRejectedValue() { return rejectedValue; }
     public String getMessage() { return message; }
     public String getCode() { return code; }
 }
}
*/