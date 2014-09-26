//
// NSThread+Blocks.m
//
// @author Dmitry Ponomarev <demdxx@gmail.com>
// @license MIT
// @year 2012
//

#ifndef __IPHONE_4_0
#import <dispatch/dispatch.h>
#endif

#import "NSThread+Blocks.h"

#ifndef __has_feature
  #define __has_feature(x) 0
#endif

#if __has_feature(objc_arc)
  #define TH_OBJECT_AUTORELEASE(obj) obj
#else
  #define TH_OBJECT_AUTORELEASE(obj) [obj autorelease]
#endif

@implementation NSThread (Blocks)

- (void)performBlock:(void(^)())block
{
  if ([[NSThread currentThread] isEqual:self]) {
    block();
  } else {
    [self performBlock:block waitUntilDone:NO];
  }
}

- (void)performBlock:(void(^)())block waitUntilDone:(BOOL)wait
{
  [NSThread performSelector:@selector(ng_runBlock:)
                   onThread:self
                 withObject:TH_OBJECT_AUTORELEASE([block copy])
              waitUntilDone:wait];
}

+ (void)ng_runBlock:(void(^)())block
{
  block();
}

+ (void)performBlockInBackground:(void(^)())block
{
#ifdef __IPHONE_4_0
  dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0), block);
#else
  [NSThread performSelectorInBackground:@selector(ng_runBlock:)
                             withObject:TH_OBJECT_AUTORELEASE([block copy])];
#endif
}

+ (void)performBlockOnMainThread:(void(^)())block
{
#ifdef __IPHONE_4_0
  dispatch_async(dispatch_get_main_queue(), block);
#else
  [NSThread performSelectorOnMainThread:@selector(ng_runBlock:)
	                           withObject:TH_OBJECT_AUTORELEASE([block copy])
                            waitUntilDone:NO];
#endif
}

@end
