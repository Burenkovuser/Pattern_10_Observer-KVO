//
//  AppDelegate.m
//  Observer KVO
//
//  Created by Vasilii on 15.06.17.
//  Copyright © 2017 Vasilii Burenkov. All rights reserved.
//

#import "AppDelegate.h"
#import "KVOSubject.h"
#import "KVOObserver.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

/*
 Как видно из примера, мы для объекта за которым мы наблюдаем, выполняем функцию addObserver – где устанавливаем кто будет наблюлать за изменениями, за изменениями какого свойства мы будем наблюдать и остальные опции. Дальше меняем значение свойства, и так как мы все это проделываем на нажатие кнопки – в конце мы удаляем наблюдателя с нашего объекта, что бы память не текла. Лог говорит сам за себя:
 */

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    KVOSubject *kvoSubj = [[KVOSubject alloc] init];
    KVOObserver *kvoObserver = [[KVOObserver alloc] init];
    
    [kvoSubj addObserver:kvoObserver forKeyPath:@"changeableProperty" options:NSKeyValueObservingOptionNew context:nil];
    [kvoSubj setValue:@"new value" forKey:@"changeableProperty"];
    
    //because kvoSubj will be deallocated after this functions ends we need to remove observer information.
    [kvoSubj removeObserver:kvoObserver forKeyPath:@"changeableProperty"];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
