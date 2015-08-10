在这个例子中，我们将在Android源代码工程的external目录中创建一个ashmem源代码工程，它里面包括两个应用程序，
一个是Server端应用程序SharedBufferServer，它提供一段共享内存来给Client端程序使用，
一个是Client端应用程序SharedBufferClient，它简单地对Server端提供的共享内存进行读和写的操作。
Server端应用程序SharedBufferServer和Client端应用程序SharedBufferClient通过Binder进程间通信机制来交互，
因此，我们需要定义自己的Binder对象接口ISharedBuffer。
Server端应用程序SharedBufferServer在内部实现了一个服务SharedBufferService，
这个服务托管给Service Manager来管理，因此，Client端应用程序SharedBufferClient可以向Service Manager请求这个SharedBufferService服务的一个远接接口，
然后就可以通过这个服务来操作Server端提供的这段共享内存了。

这个工程由三个模块组成，
第一个模块定义服务接口，它的相关源代码位于external/ashmem/common目录下，
第二个模块实现Server端应用程序SharedBufferServer，它的相关源代码位于external/ashmem/server目录下，
第三个模块实现Client端应用程序SharedBufferClient，它的相关源代码码位于external/ashmem/client目录下。

mmm external/ashmem/server   
mmm external/ashmem/client           
make snod 
emulator
adb shell
cd system/bin
./SharedBufferServer &  
验证正确性
root@android:/system/bin # ./SharedBufferClient                                
The value of the shared buffer is 0.
Add value 1 to the shared buffer.
root@android:/system/bin # ./SharedBufferClient                                
The value of the shared buffer is 1.
Add value 1 to the shared buffer.
root@android:/system/bin # ./SharedBufferClient                                
The value of the shared buffer is 2.
Add value 1 to the shared buffer.
root@android:/system/bin # ./SharedBufferClient                                
The value of the shared buffer is 3.
Add value 1 to the shared buffer.
