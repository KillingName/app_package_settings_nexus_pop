.class Lcom/android/settings/ChooseLockFinger$2;
.super Ljava/lang/Object;
.source "ChooseLockFinger.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/settings/ChooseLockFinger;->startEnrollmentWizard()V
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
    .line 129
    iput-object p1, p0, Lcom/android/settings/ChooseLockFinger$2;->this$0:Lcom/android/settings/ChooseLockFinger;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    .line 133
    :try_start_0
    iget-object v2, p0, Lcom/android/settings/ChooseLockFinger$2;->this$0:Lcom/android/settings/ChooseLockFinger;

    #getter for: Lcom/android/settings/ChooseLockFinger;->fingerhelper:Lcom/authentec/AuthentecHelper;
    invoke-static {v2}, Lcom/android/settings/ChooseLockFinger;->access$200(Lcom/android/settings/ChooseLockFinger;)Lcom/authentec/AuthentecHelper;

    move-result-object v2

    iget-object v3, p0, Lcom/android/settings/ChooseLockFinger$2;->this$0:Lcom/android/settings/ChooseLockFinger;

    iget-object v4, p0, Lcom/android/settings/ChooseLockFinger$2;->this$0:Lcom/android/settings/ChooseLockFinger;

    #getter for: Lcom/android/settings/ChooseLockFinger;->msTempPasscode:Ljava/lang/String;
    invoke-static {v4}, Lcom/android/settings/ChooseLockFinger;->access$100(Lcom/android/settings/ChooseLockFinger;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/authentec/AuthentecHelper;->startEnrollmentWizard(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    .line 136
    .local v1, miResult:I
    sparse-switch v1, :sswitch_data_0

    .line 172
    iget-object v2, p0, Lcom/android/settings/ChooseLockFinger$2;->this$0:Lcom/android/settings/ChooseLockFinger;

    iget-object v3, p0, Lcom/android/settings/ChooseLockFinger$2;->this$0:Lcom/android/settings/ChooseLockFinger;

    const v4, 0x7f08057e

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-virtual {v3, v4, v5}, Lcom/android/settings/ChooseLockFinger;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    #calls: Lcom/android/settings/ChooseLockFinger;->toast(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/android/settings/ChooseLockFinger;->access$300(Lcom/android/settings/ChooseLockFinger;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 177
    .end local v1           #miResult:I
    :goto_0
    iget-object v2, p0, Lcom/android/settings/ChooseLockFinger$2;->this$0:Lcom/android/settings/ChooseLockFinger;

    #getter for: Lcom/android/settings/ChooseLockFinger;->mChooseLockFinger:Lcom/android/settings/ChooseLockFinger;
    invoke-static {v2}, Lcom/android/settings/ChooseLockFinger;->access$000(Lcom/android/settings/ChooseLockFinger;)Lcom/android/settings/ChooseLockFinger;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/settings/ChooseLockFinger;->finish()V

    .line 178
    return-void

    .line 138
    .restart local v1       #miResult:I
    :sswitch_0
    :try_start_1
    iget-object v2, p0, Lcom/android/settings/ChooseLockFinger$2;->this$0:Lcom/android/settings/ChooseLockFinger;

    iget-object v3, p0, Lcom/android/settings/ChooseLockFinger$2;->this$0:Lcom/android/settings/ChooseLockFinger;

    const v4, 0x7f080579

    invoke-virtual {v3, v4}, Lcom/android/settings/ChooseLockFinger;->getString(I)Ljava/lang/String;

    move-result-object v3

    #calls: Lcom/android/settings/ChooseLockFinger;->toast(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/android/settings/ChooseLockFinger;->access$300(Lcom/android/settings/ChooseLockFinger;Ljava/lang/String;)V

    .line 139
    iget-object v2, p0, Lcom/android/settings/ChooseLockFinger$2;->this$0:Lcom/android/settings/ChooseLockFinger;

    new-instance v3, Lcom/android/settings/ChooseLockFinger$2$1;

    invoke-direct {v3, p0}, Lcom/android/settings/ChooseLockFinger$2$1;-><init>(Lcom/android/settings/ChooseLockFinger$2;)V

    invoke-virtual {v2, v3}, Lcom/android/settings/ChooseLockFinger;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 174
    .end local v1           #miResult:I
    :catch_0
    move-exception v2

    move-object v0, v2

    .local v0, e:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 152
    .end local v0           #e:Ljava/lang/Exception;
    .restart local v1       #miResult:I
    :sswitch_1
    :try_start_2
    iget-object v2, p0, Lcom/android/settings/ChooseLockFinger$2;->this$0:Lcom/android/settings/ChooseLockFinger;

    iget-object v3, p0, Lcom/android/settings/ChooseLockFinger$2;->this$0:Lcom/android/settings/ChooseLockFinger;

    const v4, 0x7f08057a

    invoke-virtual {v3, v4}, Lcom/android/settings/ChooseLockFinger;->getString(I)Ljava/lang/String;

    move-result-object v3

    #calls: Lcom/android/settings/ChooseLockFinger;->toast(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/android/settings/ChooseLockFinger;->access$300(Lcom/android/settings/ChooseLockFinger;Ljava/lang/String;)V

    goto :goto_0

    .line 156
    :sswitch_2
    iget-object v2, p0, Lcom/android/settings/ChooseLockFinger$2;->this$0:Lcom/android/settings/ChooseLockFinger;

    iget-object v3, p0, Lcom/android/settings/ChooseLockFinger$2;->this$0:Lcom/android/settings/ChooseLockFinger;

    const v4, 0x7f08057b

    invoke-virtual {v3, v4}, Lcom/android/settings/ChooseLockFinger;->getString(I)Ljava/lang/String;

    move-result-object v3

    #calls: Lcom/android/settings/ChooseLockFinger;->toast(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/android/settings/ChooseLockFinger;->access$300(Lcom/android/settings/ChooseLockFinger;Ljava/lang/String;)V

    goto :goto_0

    .line 160
    :sswitch_3
    iget-object v2, p0, Lcom/android/settings/ChooseLockFinger$2;->this$0:Lcom/android/settings/ChooseLockFinger;

    iget-object v3, p0, Lcom/android/settings/ChooseLockFinger$2;->this$0:Lcom/android/settings/ChooseLockFinger;

    const v4, 0x7f08057c

    invoke-virtual {v3, v4}, Lcom/android/settings/ChooseLockFinger;->getString(I)Ljava/lang/String;

    move-result-object v3

    #calls: Lcom/android/settings/ChooseLockFinger;->toast(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/android/settings/ChooseLockFinger;->access$300(Lcom/android/settings/ChooseLockFinger;Ljava/lang/String;)V

    goto :goto_0

    .line 164
    :sswitch_4
    iget-object v2, p0, Lcom/android/settings/ChooseLockFinger$2;->this$0:Lcom/android/settings/ChooseLockFinger;

    iget-object v3, p0, Lcom/android/settings/ChooseLockFinger$2;->this$0:Lcom/android/settings/ChooseLockFinger;

    const v4, 0x7f08057d

    invoke-virtual {v3, v4}, Lcom/android/settings/ChooseLockFinger;->getString(I)Ljava/lang/String;

    move-result-object v3

    #calls: Lcom/android/settings/ChooseLockFinger;->toast(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/android/settings/ChooseLockFinger;->access$300(Lcom/android/settings/ChooseLockFinger;Ljava/lang/String;)V

    goto :goto_0

    .line 168
    :sswitch_5
    iget-object v2, p0, Lcom/android/settings/ChooseLockFinger$2;->this$0:Lcom/android/settings/ChooseLockFinger;

    iget-object v3, p0, Lcom/android/settings/ChooseLockFinger$2;->this$0:Lcom/android/settings/ChooseLockFinger;

    const v4, 0x7f08057f

    invoke-virtual {v3, v4}, Lcom/android/settings/ChooseLockFinger;->getString(I)Ljava/lang/String;

    move-result-object v3

    #calls: Lcom/android/settings/ChooseLockFinger;->toast(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/android/settings/ChooseLockFinger;->access$300(Lcom/android/settings/ChooseLockFinger;Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    .line 136
    nop

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x7 -> :sswitch_5
        0x9 -> :sswitch_2
        0xc -> :sswitch_3
        0xe -> :sswitch_1
        0x63 -> :sswitch_4
    .end sparse-switch
.end method
