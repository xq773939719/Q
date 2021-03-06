// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: Person/Person.proto

// This CPP symbol can be defined to use imports that match up to the framework
// imports needed when using CocoaPods.
#if !defined(GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS)
 #define GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS 0
#endif

#if GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS
 #import <Protobuf/GPBProtocolBuffers_RuntimeSupport.h>
#else
 #import "GPBProtocolBuffers_RuntimeSupport.h"
#endif

#import <stdatomic.h>

#import "Person/Person.pbobjc.h"
// @@protoc_insertion_point(imports)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
#pragma clang diagnostic ignored "-Wdollar-in-identifier-extension"

#pragma mark - Objective C Class declarations
// Forward declarations of Objective C classes that we can use as
// static values in struct initializers.
// We don't use [Foo class] because it is not a static value.
GPBObjCClassDeclaration(Person);
GPBObjCClassDeclaration(Person_PhoneNumber);

#pragma mark - PersonRoot

@implementation PersonRoot

// No extensions in the file and no imports, so no need to generate
// +extensionRegistry.

@end

#pragma mark - PersonRoot_FileDescriptor

static GPBFileDescriptor *PersonRoot_FileDescriptor(void) {
  // This is called by +initialize so there is no need to worry
  // about thread safety of the singleton.
  static GPBFileDescriptor *descriptor = NULL;
  if (!descriptor) {
    GPB_DEBUG_CHECK_RUNTIME_VERSIONS();
    descriptor = [[GPBFileDescriptor alloc] initWithPackage:@""
                                                     syntax:GPBFileSyntaxProto3];
  }
  return descriptor;
}

#pragma mark - Person

@implementation Person

@dynamic name;
@dynamic uid;
@dynamic email;
@dynamic phoneArray, phoneArray_Count;

typedef struct Person__storage_ {
  uint32_t _has_storage_[1];
  int32_t uid;
  NSString *name;
  NSString *email;
  NSMutableArray *phoneArray;
} Person__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "name",
        .dataTypeSpecific.clazz = Nil,
        .number = Person_FieldNumber_Name,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(Person__storage_, name),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "uid",
        .dataTypeSpecific.clazz = Nil,
        .number = Person_FieldNumber_Uid,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(Person__storage_, uid),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "email",
        .dataTypeSpecific.clazz = Nil,
        .number = Person_FieldNumber_Email,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(Person__storage_, email),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "phoneArray",
        .dataTypeSpecific.clazz = GPBObjCClass(Person_PhoneNumber),
        .number = Person_FieldNumber_PhoneArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(Person__storage_, phoneArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[Person class]
                                     rootClass:[PersonRoot class]
                                          file:PersonRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(Person__storage_)
                                         flags:(GPBDescriptorInitializationFlags)(GPBDescriptorInitializationFlag_UsesClassRefs | GPBDescriptorInitializationFlag_Proto3OptionalKnown)];
    #if defined(DEBUG) && DEBUG
      NSAssert(descriptor == nil, @"Startup recursed!");
    #endif  // DEBUG
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - Enum Person_PhoneType

GPBEnumDescriptor *Person_PhoneType_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "Mobile\000Home\000Work\000";
    static const int32_t values[] = {
        Person_PhoneType_Mobile,
        Person_PhoneType_Home,
        Person_PhoneType_Work,
    };
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(Person_PhoneType)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:Person_PhoneType_IsValidValue];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL Person_PhoneType_IsValidValue(int32_t value__) {
  switch (value__) {
    case Person_PhoneType_Mobile:
    case Person_PhoneType_Home:
    case Person_PhoneType_Work:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - Person_PhoneNumber

@implementation Person_PhoneNumber

@dynamic number;
@dynamic type;

typedef struct Person_PhoneNumber__storage_ {
  uint32_t _has_storage_[1];
  Person_PhoneType type;
  NSString *number;
} Person_PhoneNumber__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "number",
        .dataTypeSpecific.clazz = Nil,
        .number = Person_PhoneNumber_FieldNumber_Number,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(Person_PhoneNumber__storage_, number),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "type",
        .dataTypeSpecific.enumDescFunc = Person_PhoneType_EnumDescriptor,
        .number = Person_PhoneNumber_FieldNumber_Type,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(Person_PhoneNumber__storage_, type),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeEnum,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[Person_PhoneNumber class]
                                     rootClass:[PersonRoot class]
                                          file:PersonRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(Person_PhoneNumber__storage_)
                                         flags:(GPBDescriptorInitializationFlags)(GPBDescriptorInitializationFlag_UsesClassRefs | GPBDescriptorInitializationFlag_Proto3OptionalKnown)];
    [localDescriptor setupContainingMessageClass:GPBObjCClass(Person)];
    #if defined(DEBUG) && DEBUG
      NSAssert(descriptor == nil, @"Startup recursed!");
    #endif  // DEBUG
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t Person_PhoneNumber_Type_RawValue(Person_PhoneNumber *message) {
  GPBDescriptor *descriptor = [Person_PhoneNumber descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:Person_PhoneNumber_FieldNumber_Type];
  return GPBGetMessageRawEnumField(message, field);
}

void SetPerson_PhoneNumber_Type_RawValue(Person_PhoneNumber *message, int32_t value) {
  GPBDescriptor *descriptor = [Person_PhoneNumber descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:Person_PhoneNumber_FieldNumber_Type];
  GPBSetMessageRawEnumField(message, field, value);
}


#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)
