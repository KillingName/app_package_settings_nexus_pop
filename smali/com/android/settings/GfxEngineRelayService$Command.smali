.class Lcom/android/settings/GfxEngineRelayService$Command;
.super Ljava/lang/Object;
.source "GfxEngineRelayService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/settings/GfxEngineRelayService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Command"
.end annotation


# instance fields
.field public mArguments:Ljava/lang/String;

.field public mCommand:Ljava/lang/String;

.field final synthetic this$0:Lcom/android/settings/GfxEngineRelayService;


# direct methods
.method public constructor <init>(Lcom/android/settings/GfxEngineRelayService;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter "command"
    .parameter "arguments"

    .prologue
    .line 45
    iput-object p1, p0, Lcom/android/settings/GfxEngineRelayService$Command;->this$0:Lcom/android/settings/GfxEngineRelayService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    iput-object p2, p0, Lcom/android/settings/GfxEngineRelayService$Command;->mCommand:Ljava/lang/String;

    .line 47
    iput-object p3, p0, Lcom/android/settings/GfxEngineRelayService$Command;->mArguments:Ljava/lang/String;

    .line 48
    return-void
.end method
