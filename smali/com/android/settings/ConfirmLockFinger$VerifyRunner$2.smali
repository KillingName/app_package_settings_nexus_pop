.class Lcom/android/settings/ConfirmLockFinger$VerifyRunner$2;
.super Ljava/lang/Object;
.source "ConfirmLockFinger.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/settings/ConfirmLockFinger$VerifyRunner;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/settings/ConfirmLockFinger$VerifyRunner;


# direct methods
.method constructor <init>(Lcom/android/settings/ConfirmLockFinger$VerifyRunner;)V
    .locals 0
    .parameter

    .prologue
    .line 198
    iput-object p1, p0, Lcom/android/settings/ConfirmLockFinger$VerifyRunner$2;->this$1:Lcom/android/settings/ConfirmLockFinger$VerifyRunner;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 200
    iget-object v2, p0, Lcom/android/settings/ConfirmLockFinger$VerifyRunner$2;->this$1:Lcom/android/settings/ConfirmLockFinger$VerifyRunner;

    iget-object v2, v2, Lcom/android/settings/ConfirmLockFinger$VerifyRunner;->this$0:Lcom/android/settings/ConfirmLockFinger;

    #getter for: Lcom/android/settings/ConfirmLockFinger;->mHeaderTextView:Landroid/widget/TextView;
    invoke-static {v2}, Lcom/android/settings/ConfirmLockFinger;->access$100(Lcom/android/settings/ConfirmLockFinger;)Landroid/widget/TextView;

    move-result-object v2

    const v3, 0x7f080581

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(I)V

    .line 201
    iget-object v2, p0, Lcom/android/settings/ConfirmLockFinger$VerifyRunner$2;->this$1:Lcom/android/settings/ConfirmLockFinger$VerifyRunner;

    iget-object v2, v2, Lcom/android/settings/ConfirmLockFinger$VerifyRunner;->this$0:Lcom/android/settings/ConfirmLockFinger;

    #getter for: Lcom/android/settings/ConfirmLockFinger;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;
    invoke-static {v2}, Lcom/android/settings/ConfirmLockFinger;->access$400(Lcom/android/settings/ConfirmLockFinger;)Lcom/android/internal/widget/LockPatternUtils;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/internal/widget/LockPatternUtils;->setLockoutAttemptDeadline()J

    move-result-wide v0

    .line 202
    .local v0, deadline:J
    iget-object v2, p0, Lcom/android/settings/ConfirmLockFinger$VerifyRunner$2;->this$1:Lcom/android/settings/ConfirmLockFinger$VerifyRunner;

    iget-object v2, v2, Lcom/android/settings/ConfirmLockFinger$VerifyRunner;->this$0:Lcom/android/settings/ConfirmLockFinger;

    #calls: Lcom/android/settings/ConfirmLockFinger;->handleAttemptLockout(J)V
    invoke-static {v2, v0, v1}, Lcom/android/settings/ConfirmLockFinger;->access$500(Lcom/android/settings/ConfirmLockFinger;J)V

    .line 203
    return-void
.end method
