# MVVM + RAC 框架说明
## MVVM 框架

MVC是构建iOS App的标准模式，是苹果推荐的一个用来组织代码的权威范式，市面上大部分App都是这样构建的，具体组建模式不细说，iOS入门者都比较了解（虽然不一定能完全去遵守），但其几个不能避免的问题却是很严重困扰开发者比如厚重的ViewController、遗失的网络逻辑（没有属于它的位置）、较差的可测试性等因此也就会有维护性较强、耦合性很低的一种新架构MVVM (MVC 引申出得新的架构)的流行。

ViewModel: 相比较于MVC新引入的视图模型。是视图显示逻辑、验证逻辑、网络请求等代码存放的地方，唯一要注意的是，任何视图本身的引用都不应该放在VM中，换句话说就是VM中不要引入UIKit.h (对于image这个，也有人将其看做数据来处理，这就看个人想法了，并不影响整体的架构)。

这样，首先解决了VC臃肿的问题，将逻辑代码、网络请求等都写入了VM中，然后又由于VM中包含了所有的展示逻辑而且不会引用V，所以它是可以通过编程充分测试的。

## ReactiveCocoa
ReactiveCocoa 可以说是结合了函数式编程和响应式编程的框架，也可称其为函数响应式编程（FRP）框架，强调一点，RAC虽然最大的优点是提供了一个单一的、统一的方法去处理异步的行为，包括delegate方法,blocks回调,target-action机制,notifications和KVO.但是不要简单的只是单纯的认为他仅仅就是减少代码复杂度，更好的配合MVVM而已

它最大的与众不同是提供了一种新的写代码的思维，由于RAC将Cocoa中KVO、UIKit event、delegate、selector等都增加了RAC支持，所以都不用去做很多跨函数的事。

## 目录结构
* Frameworks
    * 存放系统库的虚拟文件夹, 目前搭建框架的时候需要手动添加一个名称为Frameworks的虚拟文件夹,这样你在Build Phases 中添加的系统库会自动归入此文件夹，不会直接在外部显示以至于打乱目录结构。
    
* AppDelegate
    * 这个目录下放的是AppDelegate.h(.m)文件，是整个应用的入口文件，所以单独拿出来。一会儿告诉你如何写一个简洁的AppDelegate，会在这个文件夹里添加一些类，所以将其放入一个文件夹内还是很有必要的。
    
* Class
    * 工程主体类, 日常大部分开发代码均在这里,又细分了好多次级目录。

* 通用类
    * General : 通用类（文件夹项目移植过程中都不需要更改的就能直接使用的）
    * Base : 基类 （整个框架的基类）
    * Categories : 公共扩展类 （就是一些常用的类别，比如分享啊什么的）
    * Core : 公共核心类（一般存放个人信息、接口API等）
    * Models : 公共Model （公用的一些数据模型）
    * Views : 公共View （封装的一些常用的View）
    
* 工具类
    * Helpers : 工程的相关辅助类（比如类似数据请求、表单上传、网络监测等工具类）

* 宏定义类
    * Macro : 宏定义类 （就是整个应用会用到的宏定义）
    * AppMacro.h app项目的相关宏定义
    * NotificationMacro.h 通知相关的宏定义
    * VendorMacro.h 第三方相关宏定义
    * UtilsMacro.h 为简化代码的宏定义
    * ....等等
    
* Sections : 各模块的文件夹（一般而言，我们以人为单位）
    * LSSections 王隆帅的文件夹
    * CLSections 马成麟的文件夹
    ...等等等等
    每个成员的文件夹下是其所负责模块的文件夹
   * PHP : 模块名，也可以是首页（HomePage）...等等
   * ViewControllers 界面控制器存放处（这是文件夹名）
   * ViewModels 打杂的（MVVM的核心、解耦合、处理逻辑等）
   * Views 界面相关View存放处(界面相关子View)
   * Models 数据模型存放处（各种单纯的数据模型，一点都不胖，是标准的瘦Model）
    
*  Vendors : 第三方的类库/SDK，如UMeng、WeiboSDK、WeixinSDK等等。
*  Resource
    *  Fonts 字体
    *  Images 图片
    *  Sounds 声音
    *  Videos 视频
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
