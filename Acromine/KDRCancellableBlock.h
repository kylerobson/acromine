//
//  KDRCancellableBlock.h
//  Acromine
//
//  Created by Kyle Robson on 2/19/16.
//  Copyright © 2016 Kyle Robson. All rights reserved.
//

typedef void (^KDRCancellableBlock)();
NS_INLINE void KDRCancelBlock(KDRCancellableBlock block) {
    if (block) {
        block();
    }
}
