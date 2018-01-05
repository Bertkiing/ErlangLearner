### Android 性能优化部分
>Preface  由于内容比较杂，所以文章格式和条理将不讲究格式

#### 程序的内存优化
内存优化分为很多个方面，下面将逐一讨论：
1. 选择合适的容器。 其实我们从Android 的source code中也可以看出一些不同。
    1. SparseArray 代替 List来使用;
    2. ArrayMap 代替 HashMap 使用 (当存储的数量级在100以内时使用ArrayMap,否则就使用HashMap。因为ArrayMap的插入和删除效率不够高，但是能有效地减少内存占用); 

#### 程序的UI优化
> UI优化的目标：
* 减少绘图的等待时间；
* 使帧率更加平稳、连贯；
> UI布局的核心原则：**尽可能地减少View的数量**

UI 优化的方式都是固定套路：
1. 可以通过include、merge、viewstub进行布局复用；
2. 通过drawableLeft、drawableRight等属性来实现TextView + ImageView的效果;
3. 通过使用clipChildren , clipToPadding属性来实现childView 超出 parentView的限制来展示.(有些小朋友居然还用FrameLayout来实现类似效果)
4. 在创建布局时，如果使用LinearLayout，则需要保证层级不能太深；而使用RelativeLayout时，则需要避免嵌套过多(我们查看RelativeLayout的Source Code会发现，设置margin属性将会导致其测量两次，所以在使用RelativeLayout时，尽量使用padding来代替margin。AS默认创建Ativity 时，如果使用的是RelativeLayout，你会发现其也使用padding。一般人我不告诉它)。
5. 如果你还对ConstraintLayout不太了解，赶紧学着使用吧，将有效减少布局嵌套。(要不AS默认都是它呢)


[Android优化之路](https://developer.android.com/topic/performance/index.html?hl=zh-cn)