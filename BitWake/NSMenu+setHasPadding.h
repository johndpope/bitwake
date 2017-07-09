//
//  NSMenu+setHasPadding.h
//  BitWake
//
//  Created by Niklas Berglund on 2017-07-08.
//  Copyright © 2017 Niklas Berglund. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <Foundation/Foundation.h>

@interface NSMenu (setHasPadding)
- (void)_setHasPadding:(BOOL)pad onEdge:(NSRectEdge)whatEdge;
@end
