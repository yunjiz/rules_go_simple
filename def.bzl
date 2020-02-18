"""def.bzl contains public definitions for rules_go_simple.
These definitions may be used by Bazel projects for building Go programs.
These definitions should be loaded from here, not any internal directory.
Internal definitions may change without notice.
"""

load(
    "//internal:rules.bzl",
    _go_binary = "go_binary",
    _go_library = "go_library",
)
load(
    "//internal:providers.bzl",
    _GoLibraryInfo = "GoLibraryInfo",
)

go_binary = _go_binary
go_library = _go_library
GoLibraryInfo = _GoLibraryInfo