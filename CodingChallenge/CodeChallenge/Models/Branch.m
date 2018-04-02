//
//  Branch.m
//  CodeChallenge
//
//  Created by MAC_A_120413 on 4/1/18.
//

#import "Branch.h"
#import "NSDictionary+Networking.h"

@implementation Branch

+ (instancetype)branchWithPayload:(NSDictionary *)payload{
    Branch *branch = [[Branch alloc] init];
    branch.name = [payload networkObjectForKey:@"name"];
    branch.sha = [[payload networkObjectForKey:@"commit"] networkObjectForKey:@"sha"];
    return branch;
}

@end
