.class public Lcom/android/settings/GfxEngineRelayService;
.super Landroid/app/Service;
.source "GfxEngineRelayService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/settings/GfxEngineRelayService$1;,
        Lcom/android/settings/GfxEngineRelayService$RelayReceiverServiceImpl;,
        Lcom/android/settings/GfxEngineRelayService$Command;,
        Lcom/android/settings/GfxEngineRelayService$Receiver;
    }
.end annotation


# static fields
.field private static mCommandBuffer:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/settings/GfxEngineRelayService$Command;",
            ">;"
        }
    .end annotation
.end field

.field private static mEventBuffer:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static mEventBufferSemaphore:Ljava/util/concurrent/Semaphore;

.field static mLocalReceiver:Lcom/android/settings/GfxEngineRelayService$Receiver;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 22
    sput-object v1, Lcom/android/settings/GfxEngineRelayService;->mLocalReceiver:Lcom/android/settings/GfxEngineRelayService$Receiver;

    .line 38
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/android/settings/GfxEngineRelayService;->mCommandBuffer:Ljava/util/ArrayList;

    .line 39
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/android/settings/GfxEngineRelayService;->mEventBuffer:Ljava/util/List;

    .line 40
    sput-object v1, Lcom/android/settings/GfxEngineRelayService;->mEventBufferSemaphore:Ljava/util/concurrent/Semaphore;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 65
    return-void
.end method

.method static synthetic access$100()Ljava/util/ArrayList;
    .locals 1

    .prologue
    .line 15
    sget-object v0, Lcom/android/settings/GfxEngineRelayService;->mCommandBuffer:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$200()Ljava/util/concurrent/Semaphore;
    .locals 1

    .prologue
    .line 15
    sget-object v0, Lcom/android/settings/GfxEngineRelayService;->mEventBufferSemaphore:Ljava/util/concurrent/Semaphore;

    return-object v0
.end method

.method static synthetic access$300()Ljava/util/List;
    .locals 1

    .prologue
    .line 15
    sget-object v0, Lcom/android/settings/GfxEngineRelayService;->mEventBuffer:Ljava/util/List;

    return-object v0
.end method

.method public static queueEvent(Ljava/lang/String;)V
    .locals 1
    .parameter "event"

    .prologue
    .line 52
    sget-object v0, Lcom/android/settings/GfxEngineRelayService;->mEventBufferSemaphore:Ljava/util/concurrent/Semaphore;

    if-nez v0, :cond_0

    .line 55
    :goto_0
    return-void

    .line 53
    :cond_0
    sget-object v0, Lcom/android/settings/GfxEngineRelayService;->mEventBuffer:Ljava/util/List;

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 54
    sget-object v0, Lcom/android/settings/GfxEngineRelayService;->mEventBufferSemaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->release()V

    goto :goto_0
.end method

.method public static setLocalReceiver(Lcom/android/settings/GfxEngineRelayService$Receiver;)V
    .locals 3
    .parameter "localReceiver"

    .prologue
    .line 25
    :cond_0
    :goto_0
    sget-object v1, Lcom/android/settings/GfxEngineRelayService;->mCommandBuffer:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    .line 26
    sget-object v1, Lcom/android/settings/GfxEngineRelayService;->mCommandBuffer:Ljava/util/ArrayList;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/settings/GfxEngineRelayService$Command;

    .line 27
    .local v0, storedCommand:Lcom/android/settings/GfxEngineRelayService$Command;
    if-eqz p0, :cond_0

    .line 30
    iget-object v1, v0, Lcom/android/settings/GfxEngineRelayService$Command;->mCommand:Ljava/lang/String;

    iget-object v2, v0, Lcom/android/settings/GfxEngineRelayService$Command;->mArguments:Ljava/lang/String;

    invoke-interface {p0, v1, v2}, Lcom/android/settings/GfxEngineRelayService$Receiver;->receiveCommand(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 35
    .end local v0           #storedCommand:Lcom/android/settings/GfxEngineRelayService$Command;
    :cond_1
    sput-object p0, Lcom/android/settings/GfxEngineRelayService;->mLocalReceiver:Lcom/android/settings/GfxEngineRelayService$Receiver;

    .line 36
    return-void
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 2
    .parameter "intent"

    .prologue
    .line 60
    sget-object v0, Lcom/android/settings/GfxEngineRelayService;->mEventBuffer:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 61
    new-instance v0, Ljava/util/concurrent/Semaphore;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/Semaphore;-><init>(I)V

    sput-object v0, Lcom/android/settings/GfxEngineRelayService;->mEventBufferSemaphore:Ljava/util/concurrent/Semaphore;

    .line 62
    new-instance v0, Lcom/android/settings/GfxEngineRelayService$RelayReceiverServiceImpl;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/android/settings/GfxEngineRelayService$RelayReceiverServiceImpl;-><init>(Lcom/android/settings/GfxEngineRelayService;Lcom/android/settings/GfxEngineRelayService$1;)V

    return-object v0
.end method
