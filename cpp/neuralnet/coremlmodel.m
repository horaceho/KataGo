#import "coremlmodel.h"

@implementation KataGoModelInput

- (instancetype)initWithSwa_model_bin_inputs:(MLMultiArray *)swa_model_bin_inputs swa_model_global_inputs:(MLMultiArray *)swa_model_global_inputs swa_model_include_history:(MLMultiArray *)swa_model_include_history swa_model_symmetries:(MLMultiArray *)swa_model_symmetries {
  self = [super init];
  if (self) {
    _swa_model_bin_inputs = swa_model_bin_inputs;
    _swa_model_global_inputs = swa_model_global_inputs;
    _swa_model_include_history = swa_model_include_history;
    _swa_model_symmetries = swa_model_symmetries;
  }
  return self;
}

- (NSSet<NSString *> *)featureNames {
  return [NSSet setWithArray:@[@"swa_model_bin_inputs", @"swa_model_global_inputs", @"swa_model_include_history", @"swa_model_symmetries"]];
}

- (nullable MLFeatureValue *)featureValueForName:(NSString *)featureName {
  if ([featureName isEqualToString:@"swa_model_bin_inputs"]) {
    return [MLFeatureValue featureValueWithMultiArray:_swa_model_bin_inputs];
  }
  if ([featureName isEqualToString:@"swa_model_global_inputs"]) {
    return [MLFeatureValue featureValueWithMultiArray:_swa_model_global_inputs];
  }
  if ([featureName isEqualToString:@"swa_model_include_history"]) {
    return [MLFeatureValue featureValueWithMultiArray:_swa_model_include_history];
  }
  if ([featureName isEqualToString:@"swa_model_symmetries"]) {
    return [MLFeatureValue featureValueWithMultiArray:_swa_model_symmetries];
  }
  return nil;
}

@end

@implementation KataGoModelOutput

- (instancetype)initWithSwa_model_miscvalues_output:(MLMultiArray *)swa_model_miscvalues_output swa_model_moremiscvalues_output:(MLMultiArray *)swa_model_moremiscvalues_output swa_model_ownership_output:(MLMultiArray *)swa_model_ownership_output swa_model_policy_output:(MLMultiArray *)swa_model_policy_output swa_model_value_output:(MLMultiArray *)swa_model_value_output {
  self = [super init];
  if (self) {
    _swa_model_miscvalues_output = swa_model_miscvalues_output;
    _swa_model_moremiscvalues_output = swa_model_moremiscvalues_output;
    _swa_model_ownership_output = swa_model_ownership_output;
    _swa_model_policy_output = swa_model_policy_output;
    _swa_model_value_output = swa_model_value_output;
  }
  return self;
}

- (NSSet<NSString *> *)featureNames {
  return [NSSet setWithArray:@[@"swa_model_miscvalues_output", @"swa_model_moremiscvalues_output", @"swa_model_ownership_output", @"swa_model_policy_output", @"swa_model_value_output"]];
}

- (nullable MLFeatureValue *)featureValueForName:(NSString *)featureName {
  if ([featureName isEqualToString:@"swa_model_miscvalues_output"]) {
    return [MLFeatureValue featureValueWithMultiArray:_swa_model_miscvalues_output];
  }
  if ([featureName isEqualToString:@"swa_model_moremiscvalues_output"]) {
    return [MLFeatureValue featureValueWithMultiArray:_swa_model_moremiscvalues_output];
  }
  if ([featureName isEqualToString:@"swa_model_ownership_output"]) {
    return [MLFeatureValue featureValueWithMultiArray:_swa_model_ownership_output];
  }
  if ([featureName isEqualToString:@"swa_model_policy_output"]) {
    return [MLFeatureValue featureValueWithMultiArray:_swa_model_policy_output];
  }
  if ([featureName isEqualToString:@"swa_model_value_output"]) {
    return [MLFeatureValue featureValueWithMultiArray:_swa_model_value_output];
  }
  return nil;
}

@end

@implementation KataGoModel


/**
 URL of the underlying .mlmodelc directory.
 */
+ (nullable NSURL *)URLOfModelInThisBundle {

  NSString *modelPath = [[NSBundle bundleForClass:[self class]] pathForResource:@"KataGoModel"
                                                                         ofType:@"mlpackage"];

  if (nil == modelPath) {
    os_log_error(OS_LOG_DEFAULT,
                 "Could not load KataGoModel.mlpackage in the bundle resource");

    return nil;
  }

  NSURL *modelUrl = [NSURL fileURLWithPath:modelPath];

  NSURL *compiledUrl = [MLModel compileModelAtURL:modelUrl
                                            error:nil];

  return compiledUrl;
}


/**
 Initialize KataGoModel instance from an existing MLModel object.

 Usually the application does not use this initializer unless it makes a subclass of KataGoModel.
 Such application may want to use `-[MLModel initWithContentsOfURL:configuration:error:]` and `+URLOfModelInThisBundle` to create a MLModel object to pass-in.
 */
- (instancetype)initWithMLModel:(MLModel *)model {
  self = [super init];
  if (!self) { return nil; }
  _model = model;
  if (_model == nil) { return nil; }
  return self;
}


/**
 Initialize KataGoModel instance with the model in this bundle.
 */
- (nullable instancetype)init {
  return [self initWithContentsOfURL:(NSURL * _Nonnull)self.class.URLOfModelInThisBundle error:nil];
}


/**
 Initialize KataGoModel instance with the model in this bundle.

 @param configuration The model configuration object
 @param error If an error occurs, upon return contains an NSError object that describes the problem. If you are not interested in possible errors, pass in NULL.
 */
- (nullable instancetype)initWithConfiguration:(MLModelConfiguration *)configuration error:(NSError * _Nullable __autoreleasing * _Nullable)error {
  return [self initWithContentsOfURL:(NSURL * _Nonnull)self.class.URLOfModelInThisBundle configuration:configuration error:error];
}


/**
 Initialize KataGoModel instance from the model URL.

 @param modelURL URL to the .mlmodelc directory for KataGoModel.
 @param error If an error occurs, upon return contains an NSError object that describes the problem. If you are not interested in possible errors, pass in NULL.
 */
- (nullable instancetype)initWithContentsOfURL:(NSURL *)modelURL error:(NSError * _Nullable __autoreleasing * _Nullable)error {
  MLModel *model = [MLModel modelWithContentsOfURL:modelURL error:error];
  if (model == nil) { return nil; }
  return [self initWithMLModel:model];
}


/**
 Initialize KataGoModel instance from the model URL.

 @param modelURL URL to the .mlmodelc directory for KataGoModel.
 @param configuration The model configuration object
 @param error If an error occurs, upon return contains an NSError object that describes the problem. If you are not interested in possible errors, pass in NULL.
 */
- (nullable instancetype)initWithContentsOfURL:(NSURL *)modelURL configuration:(MLModelConfiguration *)configuration error:(NSError * _Nullable __autoreleasing * _Nullable)error {
  MLModel *model = [MLModel modelWithContentsOfURL:modelURL configuration:configuration error:error];
  if (model == nil) { return nil; }
  return [self initWithMLModel:model];
}


/**
 Construct KataGoModel instance asynchronously with configuration.
 Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.

 @param configuration The model configuration
 @param handler When the model load completes successfully or unsuccessfully, the completion handler is invoked with a valid KataGoModel instance or NSError object.
 */
+ (void)loadWithConfiguration:(MLModelConfiguration *)configuration completionHandler:(void (^)(KataGoModel * _Nullable model, NSError * _Nullable error))handler {
  [self loadContentsOfURL:(NSURL * _Nonnull)[self URLOfModelInThisBundle]
            configuration:configuration
        completionHandler:handler];
}


/**
 Construct KataGoModel instance asynchronously with URL of .mlmodelc directory and optional configuration.

 Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.

 @param modelURL The model URL.
 @param configuration The model configuration
 @param handler When the model load completes successfully or unsuccessfully, the completion handler is invoked with a valid KataGoModel instance or NSError object.
 */
+ (void)loadContentsOfURL:(NSURL *)modelURL configuration:(MLModelConfiguration *)configuration completionHandler:(void (^)(KataGoModel * _Nullable model, NSError * _Nullable error))handler {
  [MLModel loadContentsOfURL:modelURL
               configuration:configuration
           completionHandler:^(MLModel *model, NSError *error) {
    if (model != nil) {
      KataGoModel *typedModel = [[KataGoModel alloc] initWithMLModel:model];
      handler(typedModel, nil);
    } else {
      handler(nil, error);
    }
  }];
}

- (nullable KataGoModelOutput *)predictionFromFeatures:(KataGoModelInput *)input error:(NSError * _Nullable __autoreleasing * _Nullable)error {
  return [self predictionFromFeatures:input options:[[MLPredictionOptions alloc] init] error:error];
}

- (nullable KataGoModelOutput *)predictionFromFeatures:(KataGoModelInput *)input options:(MLPredictionOptions *)options error:(NSError * _Nullable __autoreleasing * _Nullable)error {
  id<MLFeatureProvider> outFeatures = [_model predictionFromFeatures:input options:options error:error];
  if (!outFeatures) { return nil; }
  return [[KataGoModelOutput alloc] initWithSwa_model_miscvalues_output:(MLMultiArray *)[outFeatures featureValueForName:@"swa_model_miscvalues_output"].multiArrayValue swa_model_moremiscvalues_output:(MLMultiArray *)[outFeatures featureValueForName:@"swa_model_moremiscvalues_output"].multiArrayValue swa_model_ownership_output:(MLMultiArray *)[outFeatures featureValueForName:@"swa_model_ownership_output"].multiArrayValue swa_model_policy_output:(MLMultiArray *)[outFeatures featureValueForName:@"swa_model_policy_output"].multiArrayValue swa_model_value_output:(MLMultiArray *)[outFeatures featureValueForName:@"swa_model_value_output"].multiArrayValue];
}

- (nullable KataGoModelOutput *)predictionFromSwa_model_bin_inputs:(MLMultiArray *)swa_model_bin_inputs swa_model_global_inputs:(MLMultiArray *)swa_model_global_inputs swa_model_include_history:(MLMultiArray *)swa_model_include_history swa_model_symmetries:(MLMultiArray *)swa_model_symmetries error:(NSError * _Nullable __autoreleasing * _Nullable)error {
  KataGoModelInput *input_ = [[KataGoModelInput alloc] initWithSwa_model_bin_inputs:swa_model_bin_inputs swa_model_global_inputs:swa_model_global_inputs swa_model_include_history:swa_model_include_history swa_model_symmetries:swa_model_symmetries];
  return [self predictionFromFeatures:input_ error:error];
}

- (nullable NSArray<KataGoModelOutput *> *)predictionsFromInputs:(NSArray<KataGoModelInput*> *)inputArray options:(MLPredictionOptions *)options error:(NSError * _Nullable __autoreleasing * _Nullable)error {
  id<MLBatchProvider> inBatch = [[MLArrayBatchProvider alloc] initWithFeatureProviderArray:inputArray];
  id<MLBatchProvider> outBatch = [_model predictionsFromBatch:inBatch options:options error:error];
  if (!outBatch) { return nil; }
  NSMutableArray<KataGoModelOutput*> *results = [NSMutableArray arrayWithCapacity:(NSUInteger)outBatch.count];
  for (NSInteger i = 0; i < outBatch.count; i++) {
    id<MLFeatureProvider> resultProvider = [outBatch featuresAtIndex:i];
    KataGoModelOutput * result = [[KataGoModelOutput alloc] initWithSwa_model_miscvalues_output:(MLMultiArray *)[resultProvider featureValueForName:@"swa_model_miscvalues_output"].multiArrayValue swa_model_moremiscvalues_output:(MLMultiArray *)[resultProvider featureValueForName:@"swa_model_moremiscvalues_output"].multiArrayValue swa_model_ownership_output:(MLMultiArray *)[resultProvider featureValueForName:@"swa_model_ownership_output"].multiArrayValue swa_model_policy_output:(MLMultiArray *)[resultProvider featureValueForName:@"swa_model_policy_output"].multiArrayValue swa_model_value_output:(MLMultiArray *)[resultProvider featureValueForName:@"swa_model_value_output"].multiArrayValue];
    [results addObject:result];
  }
  return results;
}

@end
