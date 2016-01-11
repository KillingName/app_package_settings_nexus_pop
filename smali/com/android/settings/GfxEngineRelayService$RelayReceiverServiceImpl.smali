.class Lcom/android/settings/GfxEngineRelayService$RelayReceiverServiceImpl;
.super Lcom/authentec/TrueSuiteMobile/RelayReceiverService$Stub;
.source "GfxEngineRelayService.java"

# interfaces
.implements Lcom/authentec/TrueSuiteMobile/RelayReceiverService;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/settings/GfxEngineRelayService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RelayReceiverServiceImpl"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/settings/GfxEngineRelayService;


# direct methods
.method private constructor <init>(Lcom/android/settings/GfxEngineRelayService;)V
    .locals 0
    .parameter

    .prologue
    .line 65
    iput-object p1, p0, Lcom/android/settings/GfxEngineRelayService$RelayReceiverServiceImpl;->this$0:Lcom/android/settings/GfxEngineRelayService;

    invoke-direct {p0}, Lcom/authentec/TrueSuiteMobile/RelayReceiverService$Stub;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/settings/GfxEngineRelayService;Lcom/android/settings/GfxEngineRelayService$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 65
    invoke-direct {p0, p1}, Lcom/android/settings/GfxEngineRelayService$RelayReceiverServiceImpl;-><init>(Lcom/android/settings/GfxEngineRelayService;)V

    return-void
.end method


# virtual methods
.method public quit()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 124
    invoke-static {}, Lcom/android/settings/GfxEngineRelayService;->access$200()Ljava/util/concurrent/Semaphore;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->release()V

    .line 125
    return-void
.end method

.method public receiveEvent()Ljava/lang/String;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    const-string v5, ""

    .line 101
    :try_start_0
    invoke-static {}, Lcom/android/settings/GfxEngineRelayService;->access$200()Ljava/util/concurrent/Semaphore;

    move-result-object v1

    const-wide/16 v2, 0xa

    sget-object v4, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v1, v2, v3, v4}, Ljava/util/concurrent/Semaphore;->tryAcquire(JLjava/util/concurrent/TimeUnit;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 106
    const-string v1, ""
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v1, v5

    .line 118
    .end local p0
    :goto_0
    return-object v1

    .line 108
    .restart local p0
    :catch_0
    move-exception v1

    move-object v0, v1

    .line 110
    .local v0, e:Ljava/lang/InterruptedException;
    const-string v1, ""

    move-object v1, v5

    goto :goto_0

    .line 114
    .end local v0           #e:Ljava/lang/InterruptedException;
    :cond_0
    invoke-static {}, Lcom/android/settings/GfxEngineRelayService;->access$300()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 115
    const-string v1, ""

    move-object v1, v5

    goto :goto_0

    .line 118
    :cond_1
    invoke-static {}, Lcom/android/settings/GfxEngineRelayService;->access$300()Ljava/util/List;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object p0

    .end local p0
    check-cast p0, Ljava/lang/String;

    move-object v1, p0

    goto :goto_0
.end method

.method public sendCommand(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .parameter "command"
    .parameter "args"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 73
    sget-object v1, Lcom/android/settings/GfxEngineRelayService;->mLocalReceiver:Lcom/android/settings/GfxEngineRelayService$Receiver;

    if-eqz v1, :cond_1

    .line 74
    :goto_0
    invoke-static {}, Lcom/android/settings/GfxEngineRelayService;->access$100()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 77
    invoke-static {}, Lcom/android/settings/GfxEngineRelayService;->access$100()Ljava/util/ArrayList;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/settings/GfxEngineRelayService$Command;

    .line 78
    .local v0, storedCommand:Lcom/android/settings/GfxEngineRelayService$Command;
    sget-object v1, Lcom/android/settings/GfxEngineRelayService;->mLocalReceiver:Lcom/android/settings/GfxEngineRelayService$Receiver;

    iget-object v2, v0, Lcom/android/settings/GfxEngineRelayService$Command;->mCommand:Ljava/lang/String;

    iget-object v3, v0, Lcom/android/settings/GfxEngineRelayService$Command;->mArguments:Ljava/lang/String;

    invoke-interface {v1, v2, v3}, Lcom/android/settings/GfxEngineRelayService$Receiver;->receiveCommand(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 81
    .end local v0           #storedCommand:Lcom/android/settings/GfxEngineRelayService$Command;
    :cond_0
    sget-object v1, Lcom/android/settings/GfxEngineRelayService;->mLocalReceiver:Lcom/android/settings/GfxEngineRelayService$Receiver;

    invoke-interface {v1, p1, p2}, Lcom/android/settings/GfxEngineRelayService$Receiver;->receiveCommand(Ljava/lang/String;Ljava/lang/String;)V

    .line 88
    :goto_1
    return-void

    .line 86
    :cond_1
    invoke-static {}, Lcom/android/settings/GfxEngineRelayService;->access$100()Ljava/util/ArrayList;

    move-result-object v1

    new-instance v2, Lcom/android/settings/GfxEngineRelayService$Command;

    iget-object v3, p0, Lcom/android/settings/GfxEngineRelayService$RelayReceiverServiceImpl;->this$0:Lcom/android/settings/GfxEngineRelayService;

    invoke-direct {v2, v3, p1, p2}, Lcom/android/settings/GfxEngineRelayService$Command;-><init>(Lcom/android/settings/GfxEngineRelayService;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1
.end method
