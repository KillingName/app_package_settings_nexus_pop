.class Lcom/android/settings/ConfirmLockFinger$VerifyRunner;
.super Ljava/lang/Object;
.source "ConfirmLockFinger.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/settings/ConfirmLockFinger;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "VerifyRunner"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/settings/ConfirmLockFinger;


# direct methods
.method private constructor <init>(Lcom/android/settings/ConfirmLockFinger;)V
    .locals 0
    .parameter

    .prologue
    .line 144
    iput-object p1, p0, Lcom/android/settings/ConfirmLockFinger$VerifyRunner;->this$0:Lcom/android/settings/ConfirmLockFinger;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/settings/ConfirmLockFinger;Lcom/android/settings/ConfirmLockFinger$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 144
    invoke-direct {p0, p1}, Lcom/android/settings/ConfirmLockFinger$VerifyRunner;-><init>(Lcom/android/settings/ConfirmLockFinger;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    const-string v2, "ConfirmLockFinger"

    .line 148
    iget-object v2, p0, Lcom/android/settings/ConfirmLockFinger$VerifyRunner;->this$0:Lcom/android/settings/ConfirmLockFinger;

    new-instance v3, Lcom/android/settings/ConfirmLockFinger$VerifyRunner$1;

    invoke-direct {v3, p0}, Lcom/android/settings/ConfirmLockFinger$VerifyRunner$1;-><init>(Lcom/android/settings/ConfirmLockFinger$VerifyRunner;)V

    invoke-virtual {v2, v3}, Lcom/android/settings/ConfirmLockFinger;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 159
    const/4 v1, 0x0

    .line 161
    .local v1, iResult:I
    :try_start_0
    iget-object v2, p0, Lcom/android/settings/ConfirmLockFinger$VerifyRunner;->this$0:Lcom/android/settings/ConfirmLockFinger;

    #getter for: Lcom/android/settings/ConfirmLockFinger;->fingerhelper:Lcom/authentec/AuthentecHelper;
    invoke-static {v2}, Lcom/android/settings/ConfirmLockFinger;->access$300(Lcom/android/settings/ConfirmLockFinger;)Lcom/authentec/AuthentecHelper;

    move-result-object v2

    const-string v3, "lap-verify"

    iget-object v4, p0, Lcom/android/settings/ConfirmLockFinger$VerifyRunner;->this$0:Lcom/android/settings/ConfirmLockFinger;

    invoke-virtual {v2, v3, v4}, Lcom/authentec/AuthentecHelper;->fingerprintUnlock(Ljava/lang/String;Landroid/content/Context;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 166
    :goto_0
    sparse-switch v1, :sswitch_data_0

    .line 220
    :try_start_1
    const-string v2, "ConfirmLockFinger"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Other results: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 221
    iget-object v2, p0, Lcom/android/settings/ConfirmLockFinger$VerifyRunner;->this$0:Lcom/android/settings/ConfirmLockFinger;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/android/settings/ConfirmLockFinger;->setResult(I)V

    .line 222
    iget-object v2, p0, Lcom/android/settings/ConfirmLockFinger$VerifyRunner;->this$0:Lcom/android/settings/ConfirmLockFinger;

    invoke-virtual {v2}, Lcom/android/settings/ConfirmLockFinger;->finish()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 227
    :goto_1
    const-wide/16 v2, 0x5dc

    :try_start_2
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_2

    .line 232
    :goto_2
    return-void

    .line 162
    :catch_0
    move-exception v2

    move-object v0, v2

    .line 163
    .local v0, e:Ljava/lang/Exception;
    const/16 v1, 0xe

    goto :goto_0

    .line 168
    .end local v0           #e:Ljava/lang/Exception;
    :sswitch_0
    :try_start_3
    const-string v2, "ConfirmLockFinger"

    const-string v3, "LAP Verify OK"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 169
    iget-object v2, p0, Lcom/android/settings/ConfirmLockFinger$VerifyRunner;->this$0:Lcom/android/settings/ConfirmLockFinger;

    const/4 v3, -0x1

    invoke-virtual {v2, v3}, Lcom/android/settings/ConfirmLockFinger;->setResult(I)V

    .line 170
    iget-object v2, p0, Lcom/android/settings/ConfirmLockFinger$VerifyRunner;->this$0:Lcom/android/settings/ConfirmLockFinger;

    invoke-virtual {v2}, Lcom/android/settings/ConfirmLockFinger;->finish()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_1

    .line 224
    :catch_1
    move-exception v2

    move-object v0, v2

    .restart local v0       #e:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    .line 176
    .end local v0           #e:Ljava/lang/Exception;
    :sswitch_1
    :try_start_4
    const-string v2, "ConfirmLockFinger"

    const-string v3, "No stored credential, returning OK"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 177
    iget-object v2, p0, Lcom/android/settings/ConfirmLockFinger$VerifyRunner;->this$0:Lcom/android/settings/ConfirmLockFinger;

    const/4 v3, -0x1

    invoke-virtual {v2, v3}, Lcom/android/settings/ConfirmLockFinger;->setResult(I)V

    .line 178
    iget-object v2, p0, Lcom/android/settings/ConfirmLockFinger$VerifyRunner;->this$0:Lcom/android/settings/ConfirmLockFinger;

    invoke-virtual {v2}, Lcom/android/settings/ConfirmLockFinger;->finish()V

    goto :goto_1

    .line 183
    :sswitch_2
    const-string v2, "ConfirmLockFinger"

    const-string v3, "Library failed to load... cannot proceed!"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 184
    iget-object v2, p0, Lcom/android/settings/ConfirmLockFinger$VerifyRunner;->this$0:Lcom/android/settings/ConfirmLockFinger;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/android/settings/ConfirmLockFinger;->setResult(I)V

    .line 185
    iget-object v2, p0, Lcom/android/settings/ConfirmLockFinger$VerifyRunner;->this$0:Lcom/android/settings/ConfirmLockFinger;

    invoke-virtual {v2}, Lcom/android/settings/ConfirmLockFinger;->finish()V

    goto :goto_1

    .line 190
    :sswitch_3
    const-string v2, "ConfirmLockFinger"

    const-string v3, "Simulating device lock.\nYou may not cancel!"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 191
    iget-object v2, p0, Lcom/android/settings/ConfirmLockFinger$VerifyRunner;->this$0:Lcom/android/settings/ConfirmLockFinger;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/android/settings/ConfirmLockFinger;->setResult(I)V

    .line 192
    iget-object v2, p0, Lcom/android/settings/ConfirmLockFinger$VerifyRunner;->this$0:Lcom/android/settings/ConfirmLockFinger;

    invoke-virtual {v2}, Lcom/android/settings/ConfirmLockFinger;->finish()V

    goto :goto_1

    .line 197
    :sswitch_4
    const-string v2, "ConfirmLockFinger"

    const-string v3, "UI timeout!"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 198
    iget-object v2, p0, Lcom/android/settings/ConfirmLockFinger$VerifyRunner;->this$0:Lcom/android/settings/ConfirmLockFinger;

    new-instance v3, Lcom/android/settings/ConfirmLockFinger$VerifyRunner$2;

    invoke-direct {v3, p0}, Lcom/android/settings/ConfirmLockFinger$VerifyRunner$2;-><init>(Lcom/android/settings/ConfirmLockFinger$VerifyRunner;)V

    invoke-virtual {v2, v3}, Lcom/android/settings/ConfirmLockFinger;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_1

    .line 209
    :sswitch_5
    const-string v2, "ConfirmLockFinger"

    const-string v3, "Credential locked!"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 210
    iget-object v2, p0, Lcom/android/settings/ConfirmLockFinger$VerifyRunner;->this$0:Lcom/android/settings/ConfirmLockFinger;

    new-instance v3, Lcom/android/settings/ConfirmLockFinger$VerifyRunner$3;

    invoke-direct {v3, p0}, Lcom/android/settings/ConfirmLockFinger$VerifyRunner$3;-><init>(Lcom/android/settings/ConfirmLockFinger$VerifyRunner;)V

    invoke-virtual {v2, v3}, Lcom/android/settings/ConfirmLockFinger;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_1

    .line 228
    :catch_2
    move-exception v0

    .line 230
    .local v0, e:Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_2

    .line 166
    nop

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x2 -> :sswitch_1
        0x3 -> :sswitch_5
        0x9 -> :sswitch_3
        0xe -> :sswitch_2
        0x10 -> :sswitch_4
    .end sparse-switch
.end method
