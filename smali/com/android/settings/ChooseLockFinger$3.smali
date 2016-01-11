.class Lcom/android/settings/ChooseLockFinger$3;
.super Ljava/lang/Object;
.source "ChooseLockFinger.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/settings/ChooseLockFinger;->startVerification()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/settings/ChooseLockFinger;


# direct methods
.method constructor <init>(Lcom/android/settings/ChooseLockFinger;)V
    .locals 0
    .parameter

    .prologue
    .line 185
    iput-object p1, p0, Lcom/android/settings/ChooseLockFinger$3;->this$0:Lcom/android/settings/ChooseLockFinger;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 188
    :try_start_0
    iget-object v2, p0, Lcom/android/settings/ChooseLockFinger$3;->this$0:Lcom/android/settings/ChooseLockFinger;

    #getter for: Lcom/android/settings/ChooseLockFinger;->fingerhelper:Lcom/authentec/AuthentecHelper;
    invoke-static {v2}, Lcom/android/settings/ChooseLockFinger;->access$200(Lcom/android/settings/ChooseLockFinger;)Lcom/authentec/AuthentecHelper;

    move-result-object v2

    iget-object v3, p0, Lcom/android/settings/ChooseLockFinger$3;->this$0:Lcom/android/settings/ChooseLockFinger;

    invoke-virtual {v2, v3}, Lcom/authentec/AuthentecHelper;->startVerification(Landroid/content/Context;)I

    move-result v1

    .line 191
    .local v1, miResult:I
    if-nez v1, :cond_0

    .line 193
    iget-object v2, p0, Lcom/android/settings/ChooseLockFinger$3;->this$0:Lcom/android/settings/ChooseLockFinger;

    new-instance v3, Lcom/android/settings/ChooseLockFinger$3$1;

    invoke-direct {v3, p0}, Lcom/android/settings/ChooseLockFinger$3$1;-><init>(Lcom/android/settings/ChooseLockFinger$3;)V

    invoke-virtual {v2, v3}, Lcom/android/settings/ChooseLockFinger;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 211
    .end local v1           #miResult:I
    :goto_0
    iget-object v2, p0, Lcom/android/settings/ChooseLockFinger$3;->this$0:Lcom/android/settings/ChooseLockFinger;

    #getter for: Lcom/android/settings/ChooseLockFinger;->mChooseLockFinger:Lcom/android/settings/ChooseLockFinger;
    invoke-static {v2}, Lcom/android/settings/ChooseLockFinger;->access$000(Lcom/android/settings/ChooseLockFinger;)Lcom/android/settings/ChooseLockFinger;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/settings/ChooseLockFinger;->finish()V

    .line 212
    return-void

    .line 200
    .restart local v1       #miResult:I
    :cond_0
    :try_start_1
    iget-object v2, p0, Lcom/android/settings/ChooseLockFinger$3;->this$0:Lcom/android/settings/ChooseLockFinger;

    new-instance v3, Lcom/android/settings/ChooseLockFinger$3$2;

    invoke-direct {v3, p0}, Lcom/android/settings/ChooseLockFinger$3$2;-><init>(Lcom/android/settings/ChooseLockFinger$3;)V

    invoke-virtual {v2, v3}, Lcom/android/settings/ChooseLockFinger;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 206
    .end local v1           #miResult:I
    :catch_0
    move-exception v2

    move-object v0, v2

    .line 207
    .local v0, e:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method
