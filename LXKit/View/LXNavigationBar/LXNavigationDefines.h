//
//  LXNavigationDefines.h
//  LXKit
//
//  Created by Lyon Xu on 2018/1/8.
//  Copyright © 2018 Lyon. All rights reserved.
//

// This code is distributed under the terms and conditions of the MIT license.

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

/**
 *  Source code on github : https://github.com/lyonxu/LXKit
 */

#define IsiPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

#define kNavigationBarTintColor         [UIColor blackColor]
#define kNavigationBarColor             [UIColor colorWithWhite:1.00 alpha:0.980]
#define kNavigationBarLineColor         [UIColor colorWithWhite:0.869 alpha:1]

#define kNavigationBarTitleFont         [UIFont systemFontOfSize:18]
#define kNavigationBarButtonItemFont    [UIFont systemFontOfSize:16]

#define kNavigationBarHeight            44
#define kNavigationBarStatusBarHeight   (IsiPhoneX ? 44 : 20)
#define kNavigationTotalHeight          (kNavigationBarHeight+kNavigationBarStatusBarHeight)
