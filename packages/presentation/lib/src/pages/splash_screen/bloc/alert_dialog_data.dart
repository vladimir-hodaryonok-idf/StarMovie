class AlertDialogData {
  final String title;
  final String content;
  final Function()? updateCallBack;
  final Function()? useCurrentCallBack;

  const AlertDialogData({
    required this.title,
    required this.content,
    this.updateCallBack,
    this.useCurrentCallBack,
  });
}
