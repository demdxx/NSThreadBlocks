//
// NSThread+Blocks.m
//
// @author Dmitry Ponomarev <demdxx@gmail.com>
// @license MIT
// @year 2012
//

@interface NSThread (Blocks)

- (void)performBlock:(void(^)())block;
- (void)performBlock:(void(^)())block waitUntilDone:(BOOL)wait;
+ (void)performBlockInBackground:(void(^)())block;
+ (void)performBlockOnMainThread:(void(^)())block;

@end
