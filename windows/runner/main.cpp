#include <flutter/dart_project.h>
#include <flutter/flutter_view_controller.h>
#include <windows.h>

#include "flutter_window.h"
#include "utils.h"

int APIENTRY wWinMain(_In_ HINSTANCE instance, _In_opt_ HINSTANCE prev,
                      _In_ wchar_t *command_line, _In_ int show_command) {
  // Attach to console when present (e.g., 'flutter run') or create a
  // new console when running with a debugger.
  if (!::AttachConsole(ATTACH_PARENT_PROCESS) && ::IsDebuggerPresent()) {
    CreateAndAttachConsole();
  }

  // Initialize COM, so that it is available for use in the library and/or
  // plugins.
  ::CoInitializeEx(nullptr, COINIT_APARTMENTTHREADED);

  flutter::DartProject project(L"data");

  std::vector<std::string> command_line_arguments =
      GetCommandLineArguments();

  project.set_dart_entrypoint_arguments(std::move(command_line_arguments));


  FlutterWindow window(project);
  //定义屏幕尺寸
  long width = 333;
  long height = 333;
  Win32Window::Size size(333, 333);

  //获取屏幕大小
  int scrWidth, scrHeight;
  scrWidth = GetSystemMetrics(SM_CXSCREEN);
  scrHeight = GetSystemMetrics(SM_CYSCREEN);

  // 居中显示窗口
  long x = (scrWidth - width) / 2;
  long y = (scrHeight - height) / 2;
  Win32Window::Point origin(x, y);
  if (!window.CreateAndShow(L"lol_auto_accept", origin, size)) {
    return EXIT_FAILURE;
  }
  window.SetQuitOnClose(true);

  ::MSG msg;
  while (::GetMessage(&msg, nullptr, 0, 0)) {
    ::TranslateMessage(&msg);
    ::DispatchMessage(&msg);
  }

  ::CoUninitialize();
  return EXIT_SUCCESS;
}
