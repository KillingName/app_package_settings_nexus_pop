.class Lcom/android/settings/ConfirmLockFinger$VerifyRunner$1;
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
    .line 148
    iput-object p1, p0, Lcom/android/settings/ConfirmLockFinger$VerifyRunner$1;->this$1:Lcom/android/settings/ConfirmLockFinger$VerifyRunner;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    const-string v2, ""

    .line 150
    iget-object v0, p0, Lcom/android/settings/ConfirmLockFinger$VerifyRunner$1;->this$1:Lcom/android/settings/ConfirmLockFinger$VerifyRunner;

    iget-object v0, v0, Lcom/android/settings/ConfirmLockFinger$VerifyRunner;->this$0:Lcom/android/settings/ConfirmLockFinger;

    #getter for: Lcom/android/settings/ConfirmLockFinger;->mHeaderTextView:Landroid/widget/TextView;
    invoke-static {v0}, Lcom/android/settings/ConfirmLockFinger;->access$100(Lcom/android/settings/ConfirmLockFinger;)Landroid/widget/TextView;

    move-result-object v0

    const-string v1, ""

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 151
    iget-object v0, p0, Lcom/android/settings/ConfirmLockFinger$VerifyRunner$1;->this$1:Lcom/android/settings/ConfirmLockFinger$VerifyRunner;

    iget-object v0, v0, Lcom/android/settings/ConfirmLockFinger$VerifyRunner;->this$0:Lcom/android/settings/ConfirmLockFinger;

    #getter for: Lcom/android/settings/ConfirmLockFinger;->mFooterTextView:Landroid/widget/TextView;
    invoke-static {v0}, Lcom/android/settings/ConfirmLockFinger;->access$200(Lcom/android/settings/ConfirmLockFinger;)Landroid/widget/TextView;

    move-result-object v0

    const-string v1, ""

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 152
    return-void
.end method
