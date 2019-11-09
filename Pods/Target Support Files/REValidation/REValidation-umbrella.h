#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "NSError+REValidation.h"
#import "REValidation.h"
#import "REValidator.h"
#import "REEmailValidator.h"
#import "RELengthValidator.h"
#import "REPresenceValidator.h"
#import "REURLValidator.h"

FOUNDATION_EXPORT double REValidationVersionNumber;
FOUNDATION_EXPORT const unsigned char REValidationVersionString[];

