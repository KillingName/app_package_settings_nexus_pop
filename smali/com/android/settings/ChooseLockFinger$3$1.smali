.class Lcom/android/settings/ChooseLockFinger$3$1;
.super Ljava/lang/Object;
.source "ChooseLockFinger.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/settings/ChooseLockFinger$3;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/settings/ChooseLockFinger$3;


# direct methods
.method constructor <init>(Lcom/android/settings/ChooseLockFinger$3;)V
    .locals 0
    .parameter

    .prologue
    .line 193
    iput-object p1, p0, Lcom/android/settings/ChooseLockFinger$3$1;->this$1:Lcom/android/settings/ChooseLockFinger$3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 195
    iget-object v0, p0, Lcom/android/settings/ChooseLockFinger$3$1;->this$1:Lcom/android/settings/ChooseLockFinger$3;

    iget-object v0, v0, Lcom/android/settings/ChooseLockFinger$3;->this$0:Lcom/android/settings/ChooseLockFinger;

    #getter for: Lcom/android/settings/ChooseLockFinger;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;
    invoke-static {v0}, Lcom/android/settings/ChooseLockFinger;->access$400(Lcom/android/settings/ChooseLockFinger;)Lcom/android/internal/widget/LockPatternUtils;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/android/internal/widget/LockPatternUtils;->setLockFingerEnabled(Z)V

    .line 196
    iget-object v0, p0, Lcom/android/settings/ChooseLockFinger$3$1;->this$1:Lcom/android/settings/ChooseLockFinger$3;

    iget-object v0, v0, Lcom/android/settings/ChooseLockFinger$3;->this$0:Lcom/android/settings/ChooseLockFinger;

    #getter for: Lcom/android/settings/ChooseLockFinger;->mToggleUnlockFinger:Landroid/preference/CheckBoxPreference;
    invoke-static {v0}, Lcom/android/settings/ChooseLockFinger;->access$600(Lcom/android/settings/ChooseLockFinger;)Landroid/preference/CheckBoxPreference;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 197
    return-void
.end method
