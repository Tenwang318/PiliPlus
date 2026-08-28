import 'package:chat_bottom_container/chat_bottom_container.dart';

/// Compatibility shim for chat_bottom_container 0.5.x.
///
/// The old fork exposed `keepChatPanel()` / `restoreChatPanel()` lifecycle
/// helpers that were dropped in the current version. The panel height is now
/// tracked internally by the package, so keeping is a no-op and restoring
/// simply re-asserts the current panel type.
extension ChatPanelCompat<T> on ChatBottomPanelContainerController<T> {
  void keepChatPanel() {
    // Keyboard height is persisted internally by the package; nothing to do.
  }

  void restoreChatPanel() {
    if (currentPanelType == ChatBottomPanelType.none) return;
    updatePanelType(currentPanelType);
  }
}
