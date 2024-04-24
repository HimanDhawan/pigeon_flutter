// Autogenerated from Pigeon (v10.0.0), do not edit directly.
// See also: https://pub.dev/packages/pigeon

#import "pigeon.h"
#import <Flutter/Flutter.h>

#if !__has_feature(objc_arc)
#error File requires ARC to be enabled.
#endif

static NSArray *wrapResult(id result, FlutterError *error) {
  if (error) {
    return @[
      error.code ?: [NSNull null], error.message ?: [NSNull null], error.details ?: [NSNull null]
    ];
  }
  return @[ result ?: [NSNull null] ];
}
static id GetNullableObjectAtIndex(NSArray *array, NSInteger key) {
  id result = array[key];
  return (result == [NSNull null]) ? nil : result;
}

@interface MyData ()
+ (MyData *)fromList:(NSArray *)list;
+ (nullable MyData *)nullableFromList:(NSArray *)list;
- (NSArray *)toList;
@end

@interface ResponseData ()
+ (ResponseData *)fromList:(NSArray *)list;
+ (nullable ResponseData *)nullableFromList:(NSArray *)list;
- (NSArray *)toList;
@end

@implementation MyData
+ (instancetype)makeWithName:(nullable NSString *)name
    age:(nullable NSNumber *)age {
  MyData* pigeonResult = [[MyData alloc] init];
  pigeonResult.name = name;
  pigeonResult.age = age;
  return pigeonResult;
}
+ (MyData *)fromList:(NSArray *)list {
  MyData *pigeonResult = [[MyData alloc] init];
  pigeonResult.name = GetNullableObjectAtIndex(list, 0);
  pigeonResult.age = GetNullableObjectAtIndex(list, 1);
  return pigeonResult;
}
+ (nullable MyData *)nullableFromList:(NSArray *)list {
  return (list) ? [MyData fromList:list] : nil;
}
- (NSArray *)toList {
  return @[
    (self.name ?: [NSNull null]),
    (self.age ?: [NSNull null]),
  ];
}
@end

@implementation ResponseData
+ (instancetype)makeWithName:(nullable NSString *)name {
  ResponseData* pigeonResult = [[ResponseData alloc] init];
  pigeonResult.name = name;
  return pigeonResult;
}
+ (ResponseData *)fromList:(NSArray *)list {
  ResponseData *pigeonResult = [[ResponseData alloc] init];
  pigeonResult.name = GetNullableObjectAtIndex(list, 0);
  return pigeonResult;
}
+ (nullable ResponseData *)nullableFromList:(NSArray *)list {
  return (list) ? [ResponseData fromList:list] : nil;
}
- (NSArray *)toList {
  return @[
    (self.name ?: [NSNull null]),
  ];
}
@end

@interface MyDataApiCodecReader : FlutterStandardReader
@end
@implementation MyDataApiCodecReader
- (nullable id)readValueOfType:(UInt8)type {
  switch (type) {
    case 128: 
      return [MyData fromList:[self readValue]];
    case 129: 
      return [ResponseData fromList:[self readValue]];
    default:
      return [super readValueOfType:type];
  }
}
@end

@interface MyDataApiCodecWriter : FlutterStandardWriter
@end
@implementation MyDataApiCodecWriter
- (void)writeValue:(id)value {
  if ([value isKindOfClass:[MyData class]]) {
    [self writeByte:128];
    [self writeValue:[value toList]];
  } else if ([value isKindOfClass:[ResponseData class]]) {
    [self writeByte:129];
    [self writeValue:[value toList]];
  } else {
    [super writeValue:value];
  }
}
@end

@interface MyDataApiCodecReaderWriter : FlutterStandardReaderWriter
@end
@implementation MyDataApiCodecReaderWriter
- (FlutterStandardWriter *)writerWithData:(NSMutableData *)data {
  return [[MyDataApiCodecWriter alloc] initWithData:data];
}
- (FlutterStandardReader *)readerWithData:(NSData *)data {
  return [[MyDataApiCodecReader alloc] initWithData:data];
}
@end

NSObject<FlutterMessageCodec> *MyDataApiGetCodec(void) {
  static FlutterStandardMessageCodec *sSharedObject = nil;
  static dispatch_once_t sPred = 0;
  dispatch_once(&sPred, ^{
    MyDataApiCodecReaderWriter *readerWriter = [[MyDataApiCodecReaderWriter alloc] init];
    sSharedObject = [FlutterStandardMessageCodec codecWithReaderWriter:readerWriter];
  });
  return sSharedObject;
}

void MyDataApiSetup(id<FlutterBinaryMessenger> binaryMessenger, NSObject<MyDataApi> *api) {
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.MyDataApi.sendData"
        binaryMessenger:binaryMessenger
        codec:MyDataApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(sendDataData:completion:)], @"MyDataApi api (%@) doesn't respond to @selector(sendDataData:completion:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        MyData *arg_data = GetNullableObjectAtIndex(args, 0);
        [api sendDataData:arg_data completion:^(ResponseData *_Nullable output, FlutterError *_Nullable error) {
          callback(wrapResult(output, error));
        }];
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
}