.class Lcom/android/settings/ConfirmLockFinger$1;
.super Landroid/os/CountDownTimer;
.source "ConfirmLockFinger.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/settings/ConfirmLockFinger;->handleAttemptLockout(J)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/settings/ConfirmLockFinger;


# direct methods
.method constructor <init>(Lcom/android/settings/ConfirmLockFinger;JJ)V
    .locals 0
    .parameter
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 242
    iput-object p1, p0, Lcom/android/settings/ConfirmLockFinger$1;->this$0:Lcom/android/settings/ConfirmLockFinger;

    invoke-direct {p0, p2, p3, p4, p5}, Landroid/os/CountDownTimer;-><init>(JJ)V

    return-void
.end method


# virtual methods
.method public onFinish()V
    .locals 3

    .prologue
    const/4 v1, 0x0

    const-string v2, "ConfirmLockFinger"

    .line 254
    iget-object v0, p0, Lcom/android/settings/ConfirmLockFinger$1;->this$0:Lcom/android/settings/ConfirmLockFinger;

    #setter for: Lcom/android/settings/ConfirmLockFinger;->mNumWrongConfirmAttempts:I
    invoke-static {v0, v1}, Lcom/android/settings/ConfirmLockFinger;->access$602(Lcom/android/settings/ConfirmLockFinger;I)I

    .line 255
    const-string v0, "ConfirmLockFinger"

    const-string v0, "handleAttemptLockout: onFinish"

    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 256
    invoke-static {v1}, Lcom/android/settings/ConfirmLockFinger;->access$702(Z)Z

    .line 259
    iget-object v0, p0, Lcom/android/settings/ConfirmLockFinger$1;->this$0:Lcom/android/settings/ConfirmLockFinger;

    invoke-virtual {v0}, Lcom/android/settings/ConfirmLockFinger;->hasWindowFocus()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 260
    invoke-static {}, Lcom/android/settings/ConfirmLockFinger;->access$800()Ljava/lang/Thread;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/android/settings/ConfirmLockFinger;->access$800()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->isAlive()Z

    move-result v0

    if-nez v0, :cond_0

    .line 261
    const-string v0, "ConfirmLockFinger"

    const-string v0, "Lockout onFinish: restart verify runner"

    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 262
    invoke-static {}, Lcom/android/settings/ConfirmLockFinger;->access$800()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getState()Ljava/lang/Thread$State;

    move-result-object v0

    sget-object v1, Ljava/lang/Thread$State;->TERMINATED:Ljava/lang/Thread$State;

    if-ne v0, v1, :cond_1

    .line 266
    new-instance v0, Ljava/lang/Thread;

    iget-object v1, p0, Lcom/android/settings/ConfirmLockFinger$1;->this$0:Lcom/android/settings/ConfirmLockFinger;

    #getter for: Lcom/android/settings/ConfirmLockFinger;->mVerifyRunner:Lcom/android/settings/ConfirmLockFinger$VerifyRunner;
    invoke-static {v1}, Lcom/android/settings/ConfirmLockFinger;->access$900(Lcom/android/settings/ConfirmLockFinger;)Lcom/android/settings/ConfirmLockFinger$VerifyRunner;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-static {v0}, Lcom/android/settings/ConfirmLockFinger;->access$802(Ljava/lang/Thread;)Ljava/lang/Thread;

    .line 267
    invoke-static {}, Lcom/android/settings/ConfirmLockFinger;->access$800()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 275
    :cond_0
    :goto_0
    return-void

    .line 271
    :cond_1
    invoke-static {}, Lcom/android/settings/ConfirmLockFinger;->access$800()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    goto :goto_0
.end method

.method public onTick(J)V
    .locals 7
    .parameter "millisUntilFinished"

    .prologue
    .line 246
    const-wide/16 v1, 0x3e8

    div-long v1, p1, v1

    long-to-int v0, v1

    .line 247
    .local v0, secondsCountdown:I
    iget-object v1, p0, Lcom/android/settings/ConfirmLockFinger$1;->this$0:Lcom/android/settings/ConfirmLockFinger;

    #getter for: Lcom/android/settings/ConfirmLockFinger;->mFooterTextView:Landroid/widget/TextView;
    invoke-static {v1}, Lcom/android/settings/ConfirmLockFinger;->access$200(Lcom/android/settings/ConfirmLockFinger;)Landroid/widget/TextView;

    move-result-object v1

    iget-object v2, p0, Lcom/android/settings/ConfirmLockFinger$1;->this$0:Lcom/android/settings/ConfirmLockFinger;

    const v3, 0x7f080583

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Lcom/android/settings/ConfirmLockFinger;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 250
    return-void
.end method
