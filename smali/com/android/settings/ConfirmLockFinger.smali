.class public Lcom/android/settings/ConfirmLockFinger;
.super Landroid/app/Activity;
.source "ConfirmLockFinger.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/settings/ConfirmLockFinger$VerifyRunner;
    }
.end annotation


# static fields
.field private static final DEBUG:Z = true

.field private static final KEY_NUM_WRONG_ATTEMPTS:Ljava/lang/String; = "num_wrong_attempts"

.field private static final TAG:Ljava/lang/String; = "ConfirmLockFinger"

.field private static mExecutionThread:Ljava/lang/Thread;

.field private static sAttemptLockout:Z


# instance fields
.field private fingerhelper:Lcom/authentec/AuthentecHelper;

.field private mConfirmLockFinger:Lcom/android/settings/ConfirmLockFinger;

.field private mCountdownTimer:Landroid/os/CountDownTimer;

.field private mFooterTextView:Landroid/widget/TextView;

.field private mHeaderTextView:Landroid/widget/TextView;

.field private mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

.field private mNumWrongConfirmAttempts:I

.field private mVerifyRunner:Lcom/android/settings/ConfirmLockFinger$VerifyRunner;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 46
    const/4 v0, 0x0

    sput-object v0, Lcom/android/settings/ConfirmLockFinger;->mExecutionThread:Ljava/lang/Thread;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    .line 33
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 47
    new-instance v0, Lcom/android/settings/ConfirmLockFinger$VerifyRunner;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/android/settings/ConfirmLockFinger$VerifyRunner;-><init>(Lcom/android/settings/ConfirmLockFinger;Lcom/android/settings/ConfirmLockFinger$1;)V

    iput-object v0, p0, Lcom/android/settings/ConfirmLockFinger;->mVerifyRunner:Lcom/android/settings/ConfirmLockFinger$VerifyRunner;

    .line 144
    return-void
.end method

.method static synthetic access$100(Lcom/android/settings/ConfirmLockFinger;)Landroid/widget/TextView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 33
    iget-object v0, p0, Lcom/android/settings/ConfirmLockFinger;->mHeaderTextView:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$200(Lcom/android/settings/ConfirmLockFinger;)Landroid/widget/TextView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 33
    iget-object v0, p0, Lcom/android/settings/ConfirmLockFinger;->mFooterTextView:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$300(Lcom/android/settings/ConfirmLockFinger;)Lcom/authentec/AuthentecHelper;
    .locals 1
    .parameter "x0"

    .prologue
    .line 33
    iget-object v0, p0, Lcom/android/settings/ConfirmLockFinger;->fingerhelper:Lcom/authentec/AuthentecHelper;

    return-object v0
.end method

.method static synthetic access$400(Lcom/android/settings/ConfirmLockFinger;)Lcom/android/internal/widget/LockPatternUtils;
    .locals 1
    .parameter "x0"

    .prologue
    .line 33
    iget-object v0, p0, Lcom/android/settings/ConfirmLockFinger;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    return-object v0
.end method

.method static synthetic access$500(Lcom/android/settings/ConfirmLockFinger;J)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 33
    invoke-direct {p0, p1, p2}, Lcom/android/settings/ConfirmLockFinger;->handleAttemptLockout(J)V

    return-void
.end method

.method static synthetic access$602(Lcom/android/settings/ConfirmLockFinger;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 33
    iput p1, p0, Lcom/android/settings/ConfirmLockFinger;->mNumWrongConfirmAttempts:I

    return p1
.end method

.method static synthetic access$702(Z)Z
    .locals 0
    .parameter "x0"

    .prologue
    .line 33
    sput-boolean p0, Lcom/android/settings/ConfirmLockFinger;->sAttemptLockout:Z

    return p0
.end method

.method static synthetic access$800()Ljava/lang/Thread;
    .locals 1

    .prologue
    .line 33
    sget-object v0, Lcom/android/settings/ConfirmLockFinger;->mExecutionThread:Ljava/lang/Thread;

    return-object v0
.end method

.method static synthetic access$802(Ljava/lang/Thread;)Ljava/lang/Thread;
    .locals 0
    .parameter "x0"

    .prologue
    .line 33
    sput-object p0, Lcom/android/settings/ConfirmLockFinger;->mExecutionThread:Ljava/lang/Thread;

    return-object p0
.end method

.method static synthetic access$900(Lcom/android/settings/ConfirmLockFinger;)Lcom/android/settings/ConfirmLockFinger$VerifyRunner;
    .locals 1
    .parameter "x0"

    .prologue
    .line 33
    iget-object v0, p0, Lcom/android/settings/ConfirmLockFinger;->mVerifyRunner:Lcom/android/settings/ConfirmLockFinger$VerifyRunner;

    return-object v0
.end method

.method private handleAttemptLockout(J)V
    .locals 8
    .parameter "elapsedRealtimeDeadline"

    .prologue
    .line 237
    const/4 v0, 0x1

    sput-boolean v0, Lcom/android/settings/ConfirmLockFinger;->sAttemptLockout:Z

    .line 239
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v6

    .line 240
    .local v6, elapsedRealtime:J
    new-instance v0, Lcom/android/settings/ConfirmLockFinger$1;

    sub-long v2, p1, v6

    const-wide/16 v4, 0x3e8

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/android/settings/ConfirmLockFinger$1;-><init>(Lcom/android/settings/ConfirmLockFinger;JJ)V

    invoke-virtual {v0}, Lcom/android/settings/ConfirmLockFinger$1;->start()Landroid/os/CountDownTimer;

    move-result-object v0

    iput-object v0, p0, Lcom/android/settings/ConfirmLockFinger;->mCountdownTimer:Landroid/os/CountDownTimer;

    .line 277
    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1
    .parameter "savedInstanceState"

    .prologue
    .line 55
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 58
    new-instance v0, Lcom/android/internal/widget/LockPatternUtils;

    invoke-direct {v0, p0}, Lcom/android/internal/widget/LockPatternUtils;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/settings/ConfirmLockFinger;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    .line 59
    iput-object p0, p0, Lcom/android/settings/ConfirmLockFinger;->mConfirmLockFinger:Lcom/android/settings/ConfirmLockFinger;

    .line 61
    invoke-static {p0}, Lcom/authentec/AuthentecHelper;->getInstance(Landroid/content/Context;)Lcom/authentec/AuthentecHelper;

    move-result-object v0

    iput-object v0, p0, Lcom/android/settings/ConfirmLockFinger;->fingerhelper:Lcom/authentec/AuthentecHelper;

    .line 63
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/settings/ConfirmLockFinger;->requestWindowFeature(I)Z

    .line 64
    const v0, 0x7f03000f

    invoke-virtual {p0, v0}, Lcom/android/settings/ConfirmLockFinger;->setContentView(I)V

    .line 66
    const v0, 0x7f0b0029

    invoke-virtual {p0, v0}, Lcom/android/settings/ConfirmLockFinger;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/settings/ConfirmLockFinger;->mHeaderTextView:Landroid/widget/TextView;

    .line 67
    const v0, 0x7f0b0030

    invoke-virtual {p0, v0}, Lcom/android/settings/ConfirmLockFinger;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/settings/ConfirmLockFinger;->mFooterTextView:Landroid/widget/TextView;

    .line 69
    if-eqz p1, :cond_0

    .line 70
    const-string v0, "num_wrong_attempts"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/android/settings/ConfirmLockFinger;->mNumWrongConfirmAttempts:I

    .line 74
    :cond_0
    const/4 v0, 0x0

    sput-object v0, Lcom/android/settings/ConfirmLockFinger;->mExecutionThread:Ljava/lang/Thread;

    .line 75
    const/4 v0, 0x0

    sput-boolean v0, Lcom/android/settings/ConfirmLockFinger;->sAttemptLockout:Z

    .line 76
    return-void
.end method

.method protected onPause()V
    .locals 2

    .prologue
    .line 86
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 88
    const-string v0, "ConfirmLockFinger"

    const-string v1, "onPause"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 90
    iget-object v0, p0, Lcom/android/settings/ConfirmLockFinger;->mCountdownTimer:Landroid/os/CountDownTimer;

    if-eqz v0, :cond_0

    .line 91
    iget-object v0, p0, Lcom/android/settings/ConfirmLockFinger;->mCountdownTimer:Landroid/os/CountDownTimer;

    invoke-virtual {v0}, Landroid/os/CountDownTimer;->cancel()V

    .line 93
    :cond_0
    return-void
.end method

.method protected onResume()V
    .locals 5

    .prologue
    const-string v4, "ConfirmLockFinger"

    .line 97
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 99
    const-string v2, "ConfirmLockFinger"

    const-string v2, "onResume"

    invoke-static {v4, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 102
    iget-object v2, p0, Lcom/android/settings/ConfirmLockFinger;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    invoke-virtual {v2}, Lcom/android/internal/widget/LockPatternUtils;->getLockoutAttemptDeadline()J

    move-result-wide v0

    .line 103
    .local v0, deadline:J
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-eqz v2, :cond_0

    .line 104
    const-string v2, "ConfirmLockFinger"

    const-string v2, "onResume: In lockout state"

    invoke-static {v4, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 105
    invoke-direct {p0, v0, v1}, Lcom/android/settings/ConfirmLockFinger;->handleAttemptLockout(J)V

    .line 112
    :goto_0
    return-void

    .line 110
    :cond_0
    const/4 v2, 0x0

    sput-boolean v2, Lcom/android/settings/ConfirmLockFinger;->sAttemptLockout:Z

    goto :goto_0
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .parameter "outState"

    .prologue
    .line 81
    const-string v0, "num_wrong_attempts"

    iget v1, p0, Lcom/android/settings/ConfirmLockFinger;->mNumWrongConfirmAttempts:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 82
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 2
    .parameter "hasWindowFocus"

    .prologue
    const-string v1, "ConfirmLockFinger"

    .line 116
    invoke-super {p0, p1}, Landroid/app/Activity;->onWindowFocusChanged(Z)V

    .line 117
    if-eqz p1, :cond_0

    .line 118
    const-string v0, "ConfirmLockFinger"

    const-string v0, "onWindowFocusChanged: has window focus"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 120
    sget-object v0, Lcom/android/settings/ConfirmLockFinger;->mExecutionThread:Ljava/lang/Thread;

    if-nez v0, :cond_1

    .line 121
    const-string v0, "ConfirmLockFinger"

    const-string v0, "onWindowFocusChanged: start verify runner from scratch"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 122
    new-instance v0, Ljava/lang/Thread;

    iget-object v1, p0, Lcom/android/settings/ConfirmLockFinger;->mVerifyRunner:Lcom/android/settings/ConfirmLockFinger$VerifyRunner;

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    sput-object v0, Lcom/android/settings/ConfirmLockFinger;->mExecutionThread:Ljava/lang/Thread;

    .line 123
    sget-boolean v0, Lcom/android/settings/ConfirmLockFinger;->sAttemptLockout:Z

    if-nez v0, :cond_0

    .line 124
    sget-object v0, Lcom/android/settings/ConfirmLockFinger;->mExecutionThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 138
    :cond_0
    :goto_0
    return-void

    .line 127
    :cond_1
    sget-boolean v0, Lcom/android/settings/ConfirmLockFinger;->sAttemptLockout:Z

    if-nez v0, :cond_0

    sget-object v0, Lcom/android/settings/ConfirmLockFinger;->mExecutionThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->isAlive()Z

    move-result v0

    if-nez v0, :cond_0

    .line 128
    const-string v0, "ConfirmLockFinger"

    const-string v0, "onWindowFocusChanged: restart verify runner"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 129
    sget-object v0, Lcom/android/settings/ConfirmLockFinger;->mExecutionThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->getState()Ljava/lang/Thread$State;

    move-result-object v0

    sget-object v1, Ljava/lang/Thread$State;->TERMINATED:Ljava/lang/Thread$State;

    if-ne v0, v1, :cond_2

    .line 132
    new-instance v0, Ljava/lang/Thread;

    iget-object v1, p0, Lcom/android/settings/ConfirmLockFinger;->mVerifyRunner:Lcom/android/settings/ConfirmLockFinger$VerifyRunner;

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    sput-object v0, Lcom/android/settings/ConfirmLockFinger;->mExecutionThread:Ljava/lang/Thread;

    .line 134
    :cond_2
    sget-object v0, Lcom/android/settings/ConfirmLockFinger;->mExecutionThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    goto :goto_0
.end method
